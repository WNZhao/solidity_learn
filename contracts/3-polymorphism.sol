// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

interface IBase {
    function foo() external ; // 可以理解为都是虚函数
}
// virtual定义外部行为，override定义技术实现
contract Base{
    // 如果它不太函数体，这个合约就得用abstract来修饰了
    function foo() internal virtual {}
}

contract ContractA is Base{
    // 同名为什么可以，是安排了虚函数（后代可以使用也可以使用），后代对它重新实现（版本定义）
    function foo() internal  override {

    }
}