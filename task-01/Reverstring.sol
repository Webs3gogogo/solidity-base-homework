// SPDX-License-Identifier: MIT
pragma solidity ~0.8.0;

contract ReverString {
    function revertString(string memory str)
        public
        pure
        returns (string memory)
    {
        bytes memory arr = bytes(str);
        uint256 left = 0;
        uint256 right = arr.length - 1;
        while (left < right) {
            swap(arr, left, right);
            left++;
            right--;
        }
        return string(arr);
    }

    function swap(
        bytes memory arr,
        uint256 i,
        uint256 j
    ) private pure {
        bytes1 temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
    }
}
