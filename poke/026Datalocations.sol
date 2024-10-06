// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// 说明不同的数据存储位置：storage, memory 和 calldata
contract DataLocations {

    // 定义一个结构体 MyStruct
    struct MyStruct {
        uint256 foo;
        string text;
    }

    // 创建一个映射，映射地址到 MyStruct
    mapping(address => MyStruct) myStructs;

    // 示例函数，演示 storage、memory 和 calldata 的用法
    function examples(uint[] calldata y, string calldata s) external returns (uint[] memory) {
        // 在 myStructs 映射中设置当前用户的 MyStruct
        myStructs[msg.sender] = MyStruct({foo: 123, text: "bar"});

        // 使用 storage 引用修改 struct 数据
        MyStruct storage myStruct = myStructs[msg.sender];
        myStruct.text = "foo";

        // 使用 memory 创建一个只读的临时副本
        MyStruct memory readOnly = myStructs[msg.sender];
        readOnly.foo = 456;  // 这里的修改不会影响到实际存储的 myStructs

        // 调用内部函数，演示 calldata 的用法
        _internal(y); //节省一次赋值的操作

        // 创建并返回一个 memory 数组
        uint[] memory memArr = new uint[](3);
        memArr[0] = 234;
        return memArr;
    }

    // 一个私有函数，演示如何使用 calldata 进行操作
    function _internal(uint[] calldata y) private {
        uint x = y[0];
    }
}
