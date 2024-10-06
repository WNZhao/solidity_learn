// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Event {

    // 定义事件，最多可以索引 3 个参数
    event Log(string message, uint val);
    event IndexedLog(address indexed sender, uint val);
    event Message(address indexed _from, address indexed _to, string message);

    // 示例函数，触发 Log 和 IndexedLog 事件
    function example() external {
        emit Log("foo", 1234);
        emit IndexedLog(msg.sender, 789);
    }

    // 发送消息函数
    function sendMessage(address _to, string calldata message) external {
        emit Message(msg.sender, _to, message);
    }
}
