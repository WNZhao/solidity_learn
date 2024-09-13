// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;


// 调用者
contract Caller{
   uint public  xx;
   address calleeAddress;
   constructor(address _callee){
    calleeAddress = _callee;
   }
   function setCalleeX(uint _x) public {
      bytes memory cd = abi.encodeWithSignature("setX(uint256)", _x); // 签名时不能使用别名 这个签名手误写错了，是不会检查的时候
      (bool succ,bytes memory result) = calleeAddress.call(cd);
      if(!succ){
         revert("call failed");
      }
      (uint x) =abi.decode(result, (uint));
      xx =x;
      // ICallee callee = ICallee(calleeAddress);
      // callee.setX(_x);
     
   }

}