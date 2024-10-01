// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract FunctionOutputs {
    function returnMany() public pure returns (uint,bool) {
         return (1,true);
    }
    function named() public pure returns (uint x,bool b) {
         return (1,true);
    }
    function assigned() public pure returns (uint x,bool b) {
        //  return (1,true);
        x = 1;
        b = true;
   
    } 
    
    function destructingAssigments() public pure {
        (uint x,bool b) =  returnMany();
        (,bool _b) =  returnMany(); // 只要第二变量，记得加上那个逗号
    }

    function returnMultiple() public pure  returns (uint x,bool y,string memory z) {
        x = 1;
        y = true;
        z = "hello world";
    }

    function captureOutputs() public pure {
       (uint x1,bool y1,string memory z1) = returnMultiple();

    }
    function displayOutputs() public pure returns(uint,bool,string memory){
         (uint x1,bool y1,string memory z1) = returnMultiple();
          return (x1,y1,z1);
    } 
}