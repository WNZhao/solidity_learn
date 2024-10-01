// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract FunctionModifier {
    bool public paused;
    uint public count;

    function setPause(bool _puased) external {
        paused = _puased;
    }

    modifier whenNotPaused(){
        require(!paused,"paused");
        _; //执行真正的代码
    }

    function inc() external whenNotPaused {
        // require(!paused,"paused");
        count+=1;
    }
    
    function dec() external whenNotPaused {
        // require(!paused,"paused");
        count-=1;
    }

    modifier cap(uint _x){
        require(_x<100,"x>=100");
        _;
    }
    // 没暂停 且输入参数要大于100
    function incBy(uint _x) external whenNotPaused cap(_x){
        // require(_x<100,"x>=100");
        count+=_x;
    }

    // 三明治装饰器
    modifier sandwich(){
        count+=1;
        _;
        count*2;
    }

    function foo() external sandwich {
        count+=1;
    }
}