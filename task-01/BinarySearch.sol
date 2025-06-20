// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract BinarySearch{
    function binarySearch(int[] calldata arr, int target) public pure returns (int) {
        if (arr.length == 0) {
            return -1;
        }
        uint left = 0;
        uint right = arr.length - 1; 
        while (left <= right) {
            uint mid = left + (right - left) / 2;
            if (arr[mid] == target) {
                return int(mid);
            } else if (arr[mid] < target) {
                left = mid + 1; 
            } else {
                if (mid == 0) break;
                right = mid - 1; 
            }
        }

        return -1; 
    }
}