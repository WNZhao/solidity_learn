// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
 
contract Ownable{
    address public owner ;

    constructor(){
        owner = msg.sender;
    }

    // 只有合约部署者拥有调用权限
    modifier onlyOwner(){
        require(msg.sender == owner,"not owner");
        _;
    }

    function setOwner(address _newOwner) external onlyOwner {
       require(_newOwner!=address(0),"invalid address");
       owner = _newOwner;
    }
}