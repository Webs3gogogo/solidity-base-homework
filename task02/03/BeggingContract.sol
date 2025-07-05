// SPDX-License-Identifier: MIT
pragma solidity ^0.8;


contract BeggingContract{


    address public owner;

    mapping (address => uint256) donationMap;

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    uint256 timestamp




}