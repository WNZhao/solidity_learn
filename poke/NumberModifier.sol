// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract NumberModifier {
    uint private number;

    // Modifier to ensure number is not zero
    modifier nonZero() {
        require(number != 0, "Number is zero and cannot be processed.");
        _;
    }

    function doubleNumber() public nonZero {
        number *= 2;
    }

    function resetNumber() public {
        number = 0;
    }
}