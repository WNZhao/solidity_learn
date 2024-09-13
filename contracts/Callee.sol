// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

// 被调用者
contract Callee {
    uint256 public  x;

    function setX(uint _x) public returns(uint){
        x = _x;
        return x;
    }

    fallback() external  { 
         x = 100000000;
      }
}