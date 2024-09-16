// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract A {
    event Log(string message);

    function bar() public virtual {
        emit Log("A.bar called");
    }
}

contract B is A {
    function bar() public virtual override {
         emit Log("B.bar called");
         super.bar();
    }
}

contract C is A {
    function bar() public virtual override {
         emit Log("C.bar called");
         super.bar();
    }
}

contract D is B,C {
    function bar() public override(B,C){
        super.bar();
    }
}
