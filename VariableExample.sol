// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VariableExample{
    uint public  i=2;
    bool public  b = true;
    address public addr = address(1);

    function updateVariables() external {
        uint ii = 12;
        bool bb = false;
        address addr1 = address(0);

        i+=ii;
        b = bb;
        addr = addr1;
    }
}