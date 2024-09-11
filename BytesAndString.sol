// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract BytesAndString{
    // 初始化方式new
    string name = "BytesAndString"; // new string(5);
    bytes name1 = "BytesAndString1"; // new bytes(5);

    //new string(5)的string是不能修改的，bytes是可以修改的

    function testStringAndBytes() public  view returns(string memory){
        // 初始化方式new 为什么用new? struct初始化为什么不用new?
        string memory data = "xyz"; // new string(5)
        bytes memory data1 ="abc"; // new bytes(5)
        

        // 不同的location的memory拷贝
        data = name;
        data1 = name1;
        // 类型转换
        data1 = bytes(data);
        data = string(data1);
        // 下标访问，修改数据
        return  data;
    }
}