// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract TestContract1 {
    address public owner = msg.sender;

    // 函数用于设置新的所有者，只允许当前所有者修改
    function setOwner(address _owner) public {
        require(msg.sender == owner, "Not owner");
        owner = _owner;
    }
}

contract TestContract2 {
    address public owner = msg.sender;
    uint256 public value = msg.value;
    uint256 public x;
    uint256 public y;

    // 构造函数，允许在部署时传递 x 和 y 的初始值
    constructor(uint256 _x, uint256 _y) payable {
        x = _x;
        y = _y;
    }
}

contract Proxy {
    event Deploy(address);
    // 部署新合约的函数，可以接收字节码并且是支付的
    function deploy(bytes memory _code) external payable returns(address addr) {
        // new TestContract1();
        // 汇编的语法
        assembly{
            // create(v,p,n)
            // v amount of ETH to send
            // p = pointer in memory to start of code
            // n = size of code
            // msg.value ==>callvalue()
            // add(_code,0x20) 跳过前32个字节

            addr := create(callvalue(),add(_code,0x20),mload(_code))
        }
        require(addr!=address(0),"deploy failed");
        emit Deploy(addr);
        return addr;
    }

    // 执行
    function execute(address _target,bytes memory _data) external payable {
        (bool success,) = _target.call{value:msg.value}(_data);
        require(success,"failed");
    }
}


// 获取合约的字节码
contract Helper {

    // 获取 TestContract1 的合约字节码
    function getBytecode1() external pure returns (bytes memory) {
        bytes memory bytecode = type(TestContract1).creationCode;
        return bytecode;
    }

    // 获取 TestContract2 的合约字节码，并将构造函数参数编码进字节码中
    function getBytecode2(uint256 _x, uint256 _y) external pure returns (bytes memory) {
        bytes memory bytecode = type(TestContract2).creationCode;
        return abi.encodePacked(bytecode, abi.encode(_x, _y));
    }

    // 获取用于设置新的所有者的 calldata
    function getCalldata(address _owner) external pure returns (bytes memory) {
        return abi.encodeWithSignature("setOwner(address)", _owner);
    }
}
