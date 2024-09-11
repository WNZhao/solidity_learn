// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract LocalStorageVariable{
    int256[]  data1;
    int256[]  data2;

    function getData1()public view returns (int256[] memory){
        return  data1;
    }
    function getData2()public view returns (int256[] memory){
        return  data2;
    }
    function insertData1(int256 d)public {
        return data1.push(d);
    }
    function insertData2(int256 d)public {
        return data2.push(d);
    }
    function setData1ToData2()public {
        data1 = data2; // 值拷贝
    }

    function testSecondRule(int256[] calldata pd)public  returns (int256[] memory){
        int256[] memory td;
        td = data1; // 拷贝
        data1 = td; // 值拷贝
        // pd = data1; // calldata指读不能
        int256[] calldata cdt = pd; // 引用拷贝
        return td;
    }
}