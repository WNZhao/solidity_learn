// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract MappingType{
    // 映身只能放在stroage中
    // 改成public... 
    // mapping(string=>uint8) ages;
    mapping(string=>uint8) public  ages; // 会自动生成一个读操作

    function getAge(string memory name) public view returns(uint8){
        return ages[name];
    }
    function setAge(string memory name,uint8 age) public {
        // mapping (string=>uint8) storage myages = ages;
        ages[name] = age;
    }
    // 一般规则 public memory 
    // calldata internal private 可以是storage
    // mapping 只能是storage
    // public 函数的参数列表或返回值类型不能出现mapping类型
    // 
    // 写一个internal或private函数，传递storage的mapping                                                                                                                                                                                                                                                                                                                                                                                                                                                   
                                                                                                                                                                                                                                                                                                                                                                                                                                                   
}