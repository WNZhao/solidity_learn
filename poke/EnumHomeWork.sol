// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

contract OrderProcessing {

    // 声明枚举类型 OrderStatus，定义订单的状态
    enum OrderStatus {
        None,
        Pending,
        Shipped,
        Completed,
        Rejected,
        Cancelled
    }

    // 声明结构体 Order，包含买家地址和订单状态
    struct Order {
        address buyer;
        OrderStatus status;
    }

    // 存储所有订单的数组
    Order[] public orders;

    // 添加新订单到数组，初始状态为 Pending
    function addOrder() external {
        orders.push(Order(msg.sender, OrderStatus.Pending));
    }

    // 更新特定订单的状态
    function updateOrderStatus(uint orderIndex, OrderStatus newStatus) external {
        require(orderIndex < orders.length, "Invalid order index");
        require(orders[orderIndex].buyer == msg.sender, "You are not the buyer of this order");
        orders[orderIndex].status = newStatus;
    }

    // 获取特定订单的状态
    function getOrderStatus(uint orderIndex) external view returns (OrderStatus) {
        require(orderIndex < orders.length, "Invalid order index");
        return orders[orderIndex].status;
    }

    // 重置特定订单的状态为默认值 None
    function resetOrderStatus(uint orderIndex) external {
        require(orderIndex < orders.length, "Invalid order index");
        require(orders[orderIndex].buyer == msg.sender, "You are not the buyer of this order");
        orders[orderIndex].status = OrderStatus.None;
    }

    // 获取订单总数
    function getOrderCount() external view returns (uint) {
        return orders.length;
    }
}
