// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

contract Enum {

    // 定义订单状态的枚举
    enum Status {
        None,
        Pending,
        Shipped,
        Completed,
        Rejected,
        Canceled
    }

    // 公开的订单状态
    Status public status;

    // 定义订单结构体
    struct Order {
        address buyer;
        Status status;
    }

    // 公开的订单映射
    Order public orders;

    // 返回当前状态
    function get() external view returns (Status) {
        return status;
    }

    // 设置状态
    function set(Status _status) external {
        status = _status;
    }

    // 将状态设置为已发货
    function ship() external {
        status = Status.Shipped;
    }

    function reset() external {
        delete status; //默认值是第一个定义的值
    }
}
