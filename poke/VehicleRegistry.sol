// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

contract VehicleRegistry {

    // 定义一个 Vehicle 结构体
    struct Vehicle {
        string make;  // 制造商
        uint year;    // 生产年份
        address owner; // 车主
    }

    // 用于存储所有车辆的数组
    Vehicle[] public vehicles;

    // 添加新的车辆到数组中
    function addVehicle(string memory _make, uint _year) public {
        // 创建新 Vehicle 并添加到数组
        vehicles.push(Vehicle(_make, _year, msg.sender));
    }

    // 获取特定车辆的信息
    function getVehicle(uint index) public view returns (string memory make, uint year, address owner) {
        require(index < vehicles.length, "Invalid vehicle index");
        Vehicle storage vehicle = vehicles[index];
        return (vehicle.make, vehicle.year, vehicle.owner);
    }

    // 修改特定车辆的年份
    function updateVehicleYear(uint index, uint _newYear) public {
        require(index < vehicles.length, "Invalid vehicle index");
        Vehicle storage vehicle = vehicles[index];
        require(vehicle.owner == msg.sender, "You are not the owner of this vehicle");
        vehicle.year = _newYear;
    }

    // 删除特定车辆
    function deleteVehicle(uint index) public {
        require(index < vehicles.length, "Invalid vehicle index");
        Vehicle storage vehicle = vehicles[index];
        require(vehicle.owner == msg.sender, "You are not the owner of this vehicle");

        // 将要删除的元素与数组的最后一个元素交换并移除最后一个
        vehicles[index] = vehicles[vehicles.length - 1];
        vehicles.pop();
    }

    // 获取车辆总数
    function getTotalVehicles() public view returns (uint) {
        return vehicles.length;
    }
}
