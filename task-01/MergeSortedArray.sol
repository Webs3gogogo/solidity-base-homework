// SPDX-License-Identifier: MIT
pragma solidity ~0.8;

contract MergeSortedArray {
    function mergeSortedArray(int256[] memory arr1, int256[] memory arr2)
        public
        pure
        returns (int256[] memory)
    {
        int256[] memory merged = new int256[](arr1.length + arr2.length);

        uint256 i = 0;
        uint256 j = 0;
        uint256 index = 0;
        while (i < arr1.length && j < arr2.length) {
            if (arr1[i] <= arr2[j]) {
                merged[index] = arr1[i];
                i++;
            } else {
                merged[index] = arr2[j];
                j++;
            }
            index++;
        }
        while (i < arr1.length) {
            merged[index] = arr1[i];
            i++;
            index++;
        }
        while (j < arr2.length) {
            merged[index] = arr2[j];
            j++;
            index++;
        }
        return merged;
    }
}
