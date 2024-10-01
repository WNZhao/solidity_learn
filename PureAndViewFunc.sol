// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract PureAndViewPunc {
    uint256 public storeNum;

    constructor(uint256 _initNum){
        storeNum = _initNum;
    }

    function getMulti(uint a,uint b)public pure returns(uint){
        return a*b;
    }

    function getStatus() public view returns (uint256){
        return storeNum;
    }
}