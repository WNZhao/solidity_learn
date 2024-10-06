// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

contract Structs {

    struct Car {
        string model;
        uint year;
        address owner;
    }

    Car public car; // 单个Car结构体实例
    Car[] public cars; // Car结构体的数组
    mapping(address => Car[]) public carsByOwner; // 用于按owner地址存储多个Car的映射

    function examples() external {
        // 创建 Car 的实例，存储在内存中
        Car memory toyota = Car("Toyota", 1990, msg.sender);
        Car memory lambo = Car({year: 1980, model: "Lamborghini", owner: msg.sender});
        Car memory tesla;
        tesla.model = "Tesla";
        tesla.year = 2010;
        tesla.owner = msg.sender;

        // 向数组中添加 Car 结构体
        cars.push(toyota);
        cars.push(lambo);
        cars.push(tesla);

        // 将不同的车映射到它们的所有者地址
        carsByOwner[msg.sender].push(toyota);
        carsByOwner[msg.sender].push(lambo);
        carsByOwner[msg.sender].push(tesla);

        // 直接用一行
        cars.push(Car("Ferrari",2020,msg.sender));
        // Car memory _car = cars[0];
        // _car.model;
        Car storage _car = cars[0];
        _car.years = 1999; // 函数执行完，这个数据会更新
        // 删除字段
        delete _car.owner;
        delete _car[1];
    }
}
