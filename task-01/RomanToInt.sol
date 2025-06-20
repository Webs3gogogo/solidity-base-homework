// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract RomanToInt {
    mapping(bytes1 => uint256) romanMap;

    constructor() {
        romanMap["I"] = 1;
        romanMap["V"] = 5;
        romanMap["X"] = 10;
        romanMap["L"] = 50;
        romanMap["C"] = 100;
        romanMap["D"] = 500;
        romanMap["M"] = 1000;
    }

    function romanToInt(string memory romanStr) public view returns (uint256) {
        uint256 sum = 0;
        bytes memory arr = bytes(romanStr);
        for (uint256 i = 0; i < arr.length; ) {
            uint256 num = romanMap[arr[i]];
            if ((i + 1 < arr.length) && (num < romanMap[arr[i + 1]])) {
                sum = sum - num + romanMap[arr[i + 1]];
                i += 2;
            } else {
                sum += num;
                i++;
            }
        }
        return sum;
    }
}
