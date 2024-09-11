// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract BanlanceManager {
   // 余额管理器 就是一种记帐 
   // 区块链 以太坊 智能合约
  mapping (address=>uint256) public  balanceOf;  // 哪个帐号余额是多少钱
  // erc20标准还要包括如下
  string public  name = "MYDollar"; // 货币名称
  string public  symbol = "$"; // 符号
  uint8 public  decimals = 4; // 10000 是1个单位

  constructor(uint totalBalance){
    // msg.sender 合约函数的调用者
    // constructor 是合约函数的部署都
    // 部署都给调用者点钱
    balanceOf[msg.sender] = totalBalance; // 部署会花钱
  }

  // 转帐逻辑 from 写在这里不合理 所以from要从msg.sender
  function transfer(address to,uint256 amount) public {
    address from = msg.sender; // 转帐人是合约的调用者
    // 帐号余额增减的核心逻辑
    uint256 fb  = balanceOf[from];
    uint256 tb = balanceOf[to];
    require(amount <= fb,"from account do not have enough money!"); // 第二操作当不符合条件时提示
    fb=fb-amount;
    tb=tb+amount;
    balanceOf[from] = fb;
    balanceOf[to] =tb;
  }
}