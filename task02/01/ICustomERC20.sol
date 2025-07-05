// SPDX-License-Identifier: MIT
pragma solidity ^0.8;


//define interface
interface CustomERC20 {

    // 查询_account的余额
    function balanceOf(address _account) external view returns(uint balance);

    //从合约帐号转给_to  amount数量的ERC20代币
    function transfer(address _to, uint amount) external ; 

    //允许 spender 地址（通常是智能合约或交易所）从 owner 的余额中转移指定数量的代币（不超过授权值）。
    function approve(address spender, uint256 value) external returns (bool);

    function transferFrom(address from, address to, uint256 value) external returns (bool);

    function mint(address _address, uint256 amount) external;

}