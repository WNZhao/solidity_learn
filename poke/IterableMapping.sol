// SPDX-License-Identifier: MIT
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

contract BalanceManager {
    // 存储每个地址的余额
    mapping(address => uint) public balances;

    // 存储插入过的地址
    address[] public keys;

    // 记录地址是否已经插入过
    mapping(address => bool) public inserted;

    // 向 balances 中添加或更新条目，同时处理 keys 和 inserted
    function set(address addr, uint balance) public {
        // 如果地址之前没有被插入过，则插入新地址
        if (!inserted[addr]) {
            inserted[addr] = true;
            keys.push(addr);
        }
        // 更新地址的余额
        balances[addr] = balance;
    }

    // 返回当前插入的地址数量
    function getSize() public view returns (uint) {
        return keys.length;
    }

    // 根据索引返回相应地址的余额
    function getBalanceByIndex(uint index) public view returns (uint) {
        require(index < keys.length, "Index out of bounds");
        address key = keys[index];
        return balances[key];
    }
}
