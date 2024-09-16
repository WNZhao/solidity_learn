// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract Base{
    string private  name; // 可见性
    event MyEvent();
    modifier myMod(){
        _;
    }
    function foo() private {}
}

contract ContractA is Base {
    string private name; // 可见性决定它可以不可以定义重名的

    // 不可见为啥还有命名冲突呢？视频说不得而知
    function foo1() private { //private重名也不行

    }

    // 事件和函数修改器重名也会冲突的

}