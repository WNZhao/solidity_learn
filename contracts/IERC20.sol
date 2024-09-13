// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

interface IERC20 {
    function name() external view returns(string memory);
    function symbol() external view  returns(string memory);
    function decimails()external view returns(uint8);
}