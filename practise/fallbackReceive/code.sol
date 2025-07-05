// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract MyContract {
    event Received(address sender, uint256 amount);

    // 外部帐户向合约账户转账才会触发receive
    receive() external payable {
        emit Received(msg.sender, msg.value);
    }


    event FallbackCalled(address sender, uint256 amount, bytes data);

    //
    fallback() external payable {
        emit FallbackCalled(msg.sender, msg.value, msg.data);
    }
}

contract GetSig{
    function getSig() external pure returns(bytes4){
        return msg.sig;
    }
}
