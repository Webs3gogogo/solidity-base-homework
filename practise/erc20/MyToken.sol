// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permi";

contract MyToken is ERC20 {
    constructor (uint256 initialSupply) ERC20("MyToken","MTK") ERC20Permit{
        _mint(msg.sender, initialSupply);
    }
}
