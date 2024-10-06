// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

// Array 动态或固定长度
// 初始化
// Insert(push) get, update,delete,pop,length
// creating arr in memeory
// returning array from array

contract Array {
    uint[] public nums=[1,2,3]; // 动态长度的数组
    uint[3] public numsFixed=[4,5,6]; // 固定长度的数组

    function examples() external {
        nums.push(4); // 不能push 定长数组
        uint x = nums[1]; //2
        nums[2] = 777; // [1,2,777,4]
        delete nums[1]; // [1,0,777,4]; 只是把数组清掉
        nums.push(); // [1,0,777]
        uint len = nums.length;
        // create array in memory
        uint[] memory a = new uint[](5); // 内存中只能生成固定长度的数组
        // a.pop(); // 不被允许 
    }

    // 返回一个数组
    function returnArray() external view returns(uint[] memory){
        return nums; // 副本 长度越大消耗的gas越多 不建议的
    }
   // 插入数据
   function insertData(uint index, uint value) external {
    require(index < nums.length, "invalid index"); // 无需检查 index >= 0
    nums.push(); // 扩展数组长度
    uint len = nums.length;
    
    // 从最后一个元素往后移动，直到index位置
    for (uint i = len - 1; i > index; i--) {
        nums[i] = nums[i - 1];
    }
    // 插入新值
    nums[index] = value;
  }
  // 返回指定索引元素的
  function getValByIndex(uint index) public view returns(uint ) {
     require(index < nums.length, "invalid index"); // 无需检查 index >= 0
    return nums[index];
  }
 // 更新指定索引元素
  function setValue(uint index,uint value) external {
    require(index < nums.length, "invalid index"); // 无需检查 index >= 0
    nums[index] = value;
  }
  // 删除指定元素
  function deleteByIndex(uint index) public {
    require(index < nums.length, "invalid index");

        // 从索引处开始将后面的元素逐个向前移动
        for (uint i = index; i < nums.length - 1; i++) {
            nums[i] = nums[i + 1];
        }

        // 删除最后一个元素
        nums.pop();
    }
    // 返回动态数组长度
    function getSize() public view  returns(uint){
        return nums.length;
    }

}