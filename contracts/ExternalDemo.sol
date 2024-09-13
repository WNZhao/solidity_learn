// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract ExternalDemo {
    address public caller;

    function first() public {
        this.second(); // 强制内部调用， first调用是eoa
    }
    function second() external {
        caller = msg.sender; //这里的调用 是ExternalDemo的实例对象
    }
}