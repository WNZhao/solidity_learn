// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract ToDoList {

    // 定义一个 ToDo 结构体
    struct ToDo {
        string text;        // 任务描述
        bool completed;     // 是否完成
    }

    // 创建一个动态数组来存储多个 ToDo 任务
    ToDo[] public todos;

    // 创建一个新的待办事项
    function create(string memory _text) public {
        todos.push(ToDo({
            text: _text,
            completed: false
        }));
    }

    // 更新指定任务的描述
    function updateText(uint index, string memory _newText) public {
        require(index < todos.length, "Invalid index");
        todos[index].text = _newText;
    }

    // 切换任务的完成状态
    function toggleCompleted(uint index) public {
        require(index < todos.length, "Invalid index");
        todos[index].completed = !todos[index].completed;
    }

    // 获取指定任务的信息
    function getToDo(uint index) public view returns (string memory, bool) {
        require(index < todos.length, "Invalid index");
        ToDo storage todo = todos[index];
        return (todo.text, todo.completed);
    }

    // 获取所有待办事项的数量
    function getTodosCount() public view returns (uint) {
        return todos.length;
    }
}
