// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract BasicType {
    function testInt ()public pure returns (uint){
        // uint8 i8 = 255;
        // i8++;
        uint256 max = type(uint256).max; // 越界溢出问题
        // SafeMath
        // 高版本不用了
        uint8 x = 8;
        uint16 y = 9;
        y = x; // y比x的表达范围要宽
        x =uint8(y); // 强制类型转换
        return  max;
    }

    // 枚举类型
    // 首先要自己定义一个枚举类型
    enum OrderState{
        layorder,
        payment
    }
    function enumTest()public view returns (OrderState){
        OrderState state = OrderState.payment; // 1
        return state;
    } 
}