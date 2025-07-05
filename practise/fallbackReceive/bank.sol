// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Bank {
    receive() external payable {}

    event CallLog(bytes input, bytes outupt);

    function withdrawWithTransfer() external {
        payable(msg.sender).transfer(1 ether);
    }

    function withdrawWithSender() external {
        bool success = payable(msg.sender).send(1 ether);
        require(success, "Send failed");
    }

    function withdrawWithCall(bytes memory input) external {
        // ("") 传函数选择器和入场数组
        (bool success, bytes memory data) = payable(msg.sender).call{
            value: 1 ether
        }(input);
        require(success, "Call failed");
        emit CallLog(input, data );
    }
}

contract BankUser {
    Bank bank;

    constructor(address payable _bank) {
        bank = Bank(_bank);
    }

    receive() external payable {}

    function withdrawWithTransfer() external {
        bank.withdrawWithTransfer();
    }

    function withdrawWithSender() external {
        bank.withdrawWithSender();
    }

    function withdrawWithCall(bytes memory input) external {
        bank.withdrawWithCall(abi.encodePacked(input));
    }

    function testPay() external payable returns (address{
        return 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4; 
    }
}
