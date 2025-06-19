// SPDX-License-Identifier: MIT
pragma solidity ~0.8.0;

contract Voting {
    mapping(address => uint256) public voteMap;

    address[] public candicateAddressList;

    function vote(address candicateAddress) public {
        voteMap[candicateAddress]++;
        for (uint256 i = 0; i < candicateAddressList.length; i++) {
            if (candicateAddressList[i] == candicateAddress) {
                return;
            }
        }
        candicateAddressList.push(candicateAddress);
    }

    function getVotes(address candicateAddress)
        public
        view
        returns (uint256 voteCount_)
    {
        return voteMap[candicateAddress];
    }

    function resetVotes() public {
        for (uint256 i = 0; i < candicateAddressList.length; i++) {
            voteMap[candicateAddressList[i]] = 0;
        }
    }
}
