// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// 定义合约 X
contract X {
    // 定义虚拟函数 foo
    function foo() public pure virtual returns (string memory) {
        return "X";
    }

    // 定义虚拟函数 bar
    function bar() public pure virtual returns (string memory) {
        return "X";
    }

    // 额外的函数 X
    function x() public pure returns (string memory) {
        return "X";
    }
}

// 定义合约 Y 继承自 X
contract Y is X {
    // 重写函数 foo
    function foo() public pure  override virtual  returns (string memory) {
        return "Y";
    }

    // 重写函数 bar
    function bar() public pure override virtual  returns (string memory) {
        return "Y";
    }

    // 额外的函数 Y
    function y() public pure returns (string memory) {
        return "Y";
    }
}

// 定义合约 Z 继承自 Y
contract Z is Y {
    // 重写函数 foo
    function foo() public pure override returns (string memory) {
        return "Z";
    }

    // 重写函数 bar
    function bar() public pure override returns (string memory) {
        return "Z";
    }
}
