// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract ArrayType{
    uint8[3] data; // 成员变量（都是存储在stroage中的） 静态数组 
    uint8[] ddata; // 定义了一下动态数组
    // 返回类型是数组一定要有存储位置 公有函数参数不管是数组清空是struct都只能memory,如果函数是internal参数可以是storage 
    function testStaticArray()public view returns(uint8[3] memory){
        // data[0] = 25; // 这样不可以的，这是对data[0]进行写操作了
        return data; // 返回是memory 是把它拷贝到内存中才返回的
    }
    // 动态数组读操作
    function testReadDynamicArrayStorageArray()public view  returns(uint8[] memory){
      return
       ddata;
    }
    // 动态数组写操作(放在成员变量上的动态数组）
    function testWriteDynamicStorageArray()public {
        ddata.push(12); // storage的动态数组
        ddata.pop();
        ddata.push(90);
    }
    // 内存中的动态数组
    function testMemoryDynamicArra(uint8 size)public pure returns(uint8[] memory){
        uint8[] memory mdata = new uint8[](size); // 内存动态数组必须初始化，在程序运行时数组的数据才会初始化 不能使用push pop
    }
}