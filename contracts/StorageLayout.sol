// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract StorageLayout {
    uint public num; // slot0
    address public sender; // slot1
    Person person; // slot2 3,4
    bool[20] success; // slot5
    uint public value; // slot6
    // mapping array 

    struct Person {
        uint256 num;
        address sender;
        bool[12] success;
        uint256 value;
    }
}