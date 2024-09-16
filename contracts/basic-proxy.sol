// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract Logic {
    address public logic; // 占位符
    uint256 public count;

    function inc() external {
        count+=1;
    }
}

interface LogicInterface {
    function inc() external ;
}

contract Proxy {
    address public logic;
    uint256 public count;
    constructor(address _logic){
        logic = _logic;
    }
    fallback() external  {
        (bool ok,bytes memory res) = logic.delegatecall(msg.data);
        require(ok,"delegatecall failed");
     }
     // 升级
     function upgradeTo(address newVersion) external {
        logic = newVersion;
     }
}