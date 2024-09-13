// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

// 转账的接收
contract RecieveEther {
    string public caller;

    receive() external payable { 
        caller = "receiver";
    } // 
    fallback() external payable { 
        caller = "fallback";
    }

    function deposit() public {

    }
    function getBalance() public view returns (uint){
        return address(this).balance;
    }
}

// 转账发起
contract SendEther {
    function sendViaTransfer(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    function sendViaSend(address payable _to) public payable {
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send Ether");
    }

    function sendViaCall(address payable _to) public payable {
        (bool sent,bytes memory data) = _to.call{value:msg.value}("");
        require(sent,"Failed to send Ethe");
    }
    // 收款
    uint public received;
    function deposit() public payable {
        received+=msg.value;
    }
    // 
     function sendTo(address payable _to,uint amount) public payable {
        (bool sent,bytes memory data) = _to.call{value:amount}("");
        require(sent,"Failed to send Ethe");
    }
}