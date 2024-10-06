// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// 基础合约 Base
contract Base {
    event LogMessage(string message);

    // 第一个函数
    function foo() public virtual  {
        emit LogMessage("Base foo called");
    }

    // 第二个函数
    function bar() public virtual  {
        emit LogMessage("Base bar called");
    }
}

// 子合约 Child1 继承自 Base
contract Child1 is Base {
    // 重写函数 foo
    function foo() public override     {
        emit LogMessage("Child1 foo called");
    }

    // 直接调用父合约的 bar 函数
    function callBaseBar() public {
        bar(); // 直接调用父合约的 bar 函数
    }
}

// 子合约 Child2 继承自 Base
contract Child2 is Base {
    // 重写函数 bar
    function bar() public override {
        emit LogMessage("Child2 bar called");
    }
}

// 复合合约 Composite 继承自 Child1 和 Child2
contract Composite is Child1, Child2 {
    // 调用子合约的 foo 函数
    function callChild1Foo() public {
        Child1.foo(); // 调用 Child1 的 foo 函数
    }

    // 使用 super 调用父合约的 bar 函数
    function callSuperBar() public {
        super.bar(); // 使用 super 调用 Child2 的 bar 函数
    }
}
