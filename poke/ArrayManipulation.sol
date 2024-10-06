// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

contract ArrayManipulation {

    // 移除指定索引的元素并返回新的数组
    function removeElement(uint[] memory arr, uint index) public pure returns (uint[] memory) {
        // 处理边界情况：数组为空或索引超出范围
        require(arr.length > 0, "Array is empty");
        require(index < arr.length, "Invalid index");

        // 创建一个新的数组，比原数组长度少1
        uint[] memory newArr = new uint[](arr.length - 1);

        // 循环遍历并复制除了指定索引以外的所有元素
        for (uint i = 0; i < index; i++) {
            newArr[i] = arr[i];
        }
        for (uint i = index; i < arr.length - 1; i++) {
            newArr[i] = arr[i + 1];
        }

        return newArr;
    }
}
