// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract A {
    // 定义一个虚拟函数 foo
    function foo() public pure virtual returns (string memory) {
        return "A";
    }

    // 定义一个虚拟函数 bar
    function bar() public pure virtual returns (string memory) {
        return "A";
    }

    // 其他代码
    function baz() public pure returns (string memory) {
        return "A";
    }
}

contract B is A {
    // 覆盖函数 foo
    function foo() public pure override returns (string memory) {
        return "B";
    }

    // 覆盖函数 bar
    function bar() public pure override returns (string memory) {
        return "B";
    }

    // 其他代码
}
