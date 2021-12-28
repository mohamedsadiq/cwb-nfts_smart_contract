// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "hardhat/console.sol";
contract MyEpicNFT is ERC721Enumerable, Ownable {
    using SafeMath for uint256;
    using Counters for Counters.Counter;
    
    Counters.Counter private _tokenIds;
    
    uint public constant MAX_SUPPLY = 21;
    uint public constant PRICE = 0.00000001 ether;
    uint public constant MAX_PER_MINT = 1;
    
    string public baseTokenURI = "QmZGbrKmMm6TVxZNZzWrkqqxM6PfcornrwS9TFAEkYvUXY";
    
    constructor(string memory baseURI) ERC721("Certified Web3 Boy", "CWB") {
        setBaseURI(baseURI);
        console.log("This is the CWB contract. Woah!");
    }
    
    function _baseURI() internal view virtual override returns (string memory) {
        return baseTokenURI;
    }
    
    function setBaseURI(string memory _baseTokenURI) public onlyOwner {
        baseTokenURI = _baseTokenURI;
    }
    
    function mintcwb(uint _count) public payable {
        uint totalMinted = _tokenIds.current();
        
        require(totalMinted.add(_count) <= MAX_SUPPLY, "Not enough NFTs left!");
        require(_count >0 && _count <= MAX_PER_MINT, "Cannot mint specified number of NFTs.");
        require(msg.value >= PRICE.mul(_count), "Not enough ether to purchase NFTs.");

        for (uint i = 0; i < _count; i++) {
            _mintSingleNFT();
        }
    }
  
    
    function _mintSingleNFT() public {
        uint newTokenID = _tokenIds.current();

        console.log("\n--------------------");
        console.log(msg.sender, newTokenID);
        console.log("--------------------\n");

        _safeMint(msg.sender, newTokenID);
        _tokenIds.increment();
    }


    function howCwbLifted() public view returns(uint){
      uint curIds = _tokenIds.current();
        return curIds;
   }

}