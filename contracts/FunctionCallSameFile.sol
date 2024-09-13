// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

// 被调用者
contract Callee {
    uint256 public  x;
    address public caller;
    address public eoaaddress;
    function setX(uint _x) public {
        caller = msg.sender;
        eoaaddress = tx.origin;
        x = _x;
    }
}
// 调用者
contract Caller{
   address calleeAddress;
    address public caller;
     address public eoaaddress;
   constructor(address _callee){
    calleeAddress = _callee;
   }
   function setCalleeX(uint _x) public {
     caller = msg.sender;
     eoaaddress = tx.origin;
      Callee callee = Callee(calleeAddress);
      callee.setX(_x);
   }
}

