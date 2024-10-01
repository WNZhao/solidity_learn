// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// 216gas
contract Constants {
    address public constant MY_ADDRESS = 0x2E9d30761DB97706C536A112B9466433032b28e3; // 把一个状态值声明成常量可以节省gas
    uint public constant MY_UNIT = 123;
    // uint public myUint = 123;

}

// 147901gas // 没有声明常量
// 118157gas // 声明常量
//2303gas
contract Var {
    address public constant  MY_ADDRESS = 0x2E9d30761DB97706C536A112B9466433032b28e3;
}