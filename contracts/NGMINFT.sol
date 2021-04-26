pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NGMINFT is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor()
        ERC721("Not Gonna Make It NFT [NON-TRADABLE]", "NGMI")
    {

    }

    function createNFTs(address[] memory addresses) public onlyOwner {
        uint256 i = 0;
        for (i = 0; i < addresses.length; i++) {
            createNFT(addresses[i], "https://wagmit.github.io/dicpic.json");
        }
    }

    function createNFT(address player, string memory tokenURI)
        private
        returns (uint256)
    {
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        _mint(player, newItemId);
        _setTokenURI(newItemId, tokenURI);
        return newItemId;
    }

    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public override {
        require(false, "You can't get rid of this");
    }

    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public override {
        require(false, "You can't get rid of this");
    }

    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes memory _data
    ) public virtual override {
        require(false, "You can't get rid of this");
    }
}
