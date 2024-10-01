// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Constructor {
    address public owner;
    uint public x;
    // 部署的时候调用一次
    constructor(uint _x){
        owner = msg.sender; // 部署合约的地址
        x = _x;
    }
}