// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

abstract contract Base{
    constructor(string memory _name){}
}

contract ContractA is Base{
    // 调用父合约构造函数
    string name;
    constructor() Base(name){}
}