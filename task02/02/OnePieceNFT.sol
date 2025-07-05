// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

// CID: bafkreiaq4vbghjlslmkw2feuyhcezuhsrori545vpol5hz4hfs7te2ra5e

contract OnePieceNFT is ERC721URIStorage {
    using Counters for Counters.Counter; // 让 Counter 结构体能使用 Counters 库的方法
    Counters.Counter private _tokenIds; // 声明一个计数器，用于跟踪 token ID

    constructor() ERC721("OnePiece NFT", "OPN") {}

    // @dev Mint a new NFT
    // owner -> address of the contract owner
    // tokenId -> 1

    function mintNFT(address recipient, string memory tokenURI) public 
        returns (uint256)
    {
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI);
        return newItemId;
    }
}
