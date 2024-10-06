// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract SimpleStructContract {

    // 定义一个包含字符串和整数数组的结构体
    struct MyStruct {
        string myString;
        uint[] myNumbers;
    }

    // 创建一个存储 MyStruct 的状态变量
    MyStruct public myStruct;

    // 修改 struct 的字符串成员，使用 storage 存储数据
    function modifyString(string memory newString) public {
        // 使用 storage 关键字访问状态变量中的 struct 数据
        MyStruct storage s = myStruct;
        s.myString = newString;
    }

    // 读取 struct 中的整数数组成员，使用 calldata 存储位置
    function readNumbers(uint[] calldata externalNumbers) external view returns (uint[] calldata) {
        // 直接返回传入的 calldata 类型数组
        return externalNumbers;
    }

    // 用于设置整数数组
    function setNumbers(uint[] memory newNumbers) public {
        myStruct.myNumbers = newNumbers;
    }
}
