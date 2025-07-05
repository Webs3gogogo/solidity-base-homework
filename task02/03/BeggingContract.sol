// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract BeggingContract {
    address public owner;

    mapping(address => uint256) public donationMap;

    address[3] public donationList;

    //秒
    uint256 public endTime;

    event Donation(address indexed _address, uint256 indexed amount);

    constructor(uint256 _duration) {
        owner = msg.sender;
        endTime = block.timestamp + _duration;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    // receive() external payable {
    //     // address(this).balance += msg.value         [balance] field is only for read
    //     // balance += msg
    // }

    function donate() public payable {
        require(block.timestamp < endTime, "Duration has finished");
        donationMap[msg.sender] += msg.value;
        handleRankings(msg.sender);
        emit Donation(msg.sender, msg.value);
    }

    function getDonation(address _address) public view returns (uint256) {
        return donationMap[_address];
    }

    function withdraw() public onlyOwner {
        payable(owner).transfer(address(this).balance);
    }

    function handleRankings(address _address) private {
        uint256 currentDonation = donationMap[_address];

        if (currentDonation <= donationMap[donationList[2]]) {
            return;
        }
        uint8 insertPos = 2;
        while (
            insertPos > 0 &&
            currentDonation > donationMap[donationList[insertPos - 1]]
        ) {
            insertPos--;
        }
        for (uint256 j = 2; j > insertPos; j--) {
            donationList[j] = donationList[j - 1];
        }
        donationList[insertPos] = _address;
    }
}
