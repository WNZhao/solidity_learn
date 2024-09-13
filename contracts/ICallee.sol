// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

// 被调用者
interface ICallee {
    function setX(uint _x) external;
} 