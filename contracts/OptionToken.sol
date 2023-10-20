// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract OptionToken is ERC1155 {
    // mapping _tokenURIs to keep track of the token IDs and their corresponding metadata.
    mapping(uint256 => string) private _tokenURIs;
    uint256 private _currentTokenId = 1;
    address public owner;

    constructor() ERC1155("https://your-metadata-uri.com/metadata/{id}.json") {
        owner = msg.sender;
    }

    function mint(
        address account,
        uint256 amount,
        string memory tokenURI
    ) external returns (uint256) {
        uint256 newTokenId = _getNextTokenId();
        _mint(account, newTokenId, amount, "");
        _setTokenURI(newTokenId, tokenURI);
        return newTokenId;
    }

    function _getNextTokenId() private view returns (uint256) {
        return _currentTokenId + 1;
    }

    function _setTokenURI(uint256 tokenId, string memory uri) private {
        _tokenURIs[tokenId] = uri;
    }

    function getTokenUri(uint256 tokenId) public view returns (string memory) {
        return _tokenURIs[tokenId];
    }
}
