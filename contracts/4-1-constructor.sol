// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract A{
    uint public x = 5;
    constructor(){}
}

contract B is A{
    constructor(){
        x+=10;
    }
}

contract C is A{
    constructor(){
        x*=10;
    }
}

contract D is C,B{
    // 60 5*10+10
}