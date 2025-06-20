// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract IntToRoman {
    uint256[] values;
    string[] romanArr;

    constructor() {
        values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1];
        romanArr = [
            "M",
            "CM",
            "D",
            "CD",
            "C",
            "XC",
            "L",
            "XL",
            "X",
            "IX",
            "V",
            "IV",
            "I"
        ];
    }

    function intToRoman(uint256 num) public view returns (string memory) {
        bytes memory romanBytes;
        for (uint256 i = 0; i < values.length; ++i) {
            while (num >= values[i]) {
                romanBytes = abi.encodePacked(romanBytes, romanArr[i]);
                num -= values[i];
            }
            if (num == 0) break;
        }
        return string(romanBytes);
    }
}
