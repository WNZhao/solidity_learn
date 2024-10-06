// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract MessageStore {
    // 公共状态变量，用于存储字符串消息
    string public message;

    // 使用 calldata 数据位置的函数，允许用户设置消息
    function setMessage(string calldata newMessage) external {
        message = newMessage; // 将新消息存储到状态变量中
    }

    // 使用 memory 数据位置的函数，返回存储的消息
    function getMessage() external view returns (string memory) {
        return message; // 返回当前存储的消息
    }
}
