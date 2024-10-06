// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// 定义合约 A
contract ContractA {
    // 定义函数 foo，返回字符串 "A"
    function foo() public pure virtual returns (string memory) {
        return "A";
    }

    // 定义函数 bar，返回字符串 "A"
    function bar() public pure virtual returns (string memory) {
        return "A";
    }
}

// 定义合约 B，继承合约 A
contract ContractB is ContractA {
    // 重写函数 foo，返回字符串 "B"
    function foo() public pure override returns (string memory) {
        return "B";
    }

    // 重写函数 bar，返回字符串 "B"
    function bar() public pure virtual  override returns (string memory) {
        return "B";
    }
}

// 定义合约 C，继承合约 B
contract ContractC is ContractB {
    // 重写函数 bar，返回字符串 "C"
    function bar() public pure override returns (string memory) {
        return "C";
    }
}
