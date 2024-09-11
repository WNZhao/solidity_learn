// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract ComplexValueType{
    function testAddress()public view returns (address){
        // 部署实例就会有一个地址
        // 函数被执行时，调用的帐号调用
      address addr =   msg.sender; // 函数调用的web帐号msg是一个全局上下文
      return addr;
    }
    // 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4 调用地址
// 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
    function testMyAddress()public view returns (address){
        address addr = address(this); // 本合约地址 将当前实例的强制类型转换
        return addr;
    }
    // 0x358AA13c52544ECCEF6B0ADD0f801012ADAD5eE3
    // 0x358AA13c52544ECCEF6B0ADD0f801012ADAD5eE3

    //合约数据类型
    // Contract Type
    // 源码中每定义一个合约就有一个合约类型（类似java中的类）
    function testContract()public view {
        ComplexValueType mycontract = this; // 这个局部变量就是ComplexValueType的类型
    }

    // 定长字节数组 能读不能写
    function testFixedByteArray() public pure returns(bytes3){
        bytes3 data = 0x111111;
        // data[0] = 0x88; // 赋值不行
        bytes1 first = data[0];
        return first;
    } 
}

