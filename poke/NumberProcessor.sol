// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NumberProcessor {
    function processNumber(int x) public pure returns (string memory) {
        return (x < 10) ? "xiaoyu" : (x >= 10 && x <= 20) ? "between 10 and 20" : "grater 20";
    }
}
