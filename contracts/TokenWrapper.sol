// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "./OptionToken.sol";

contract TokenWrapper is ERC1155 {
    OptionToken public erc1155;
    address public owner;
    uint256 public tokenId;

    constructor(
        address _erc1155Address
    ) ERC1155("https://your-metadata-uri.com/metadata/{id}.json") {
        erc1155 = OptionToken(_erc1155Address);
        owner = msg.sender;
        tokenId = 1;
    }

    // This function is called by router. The tokens should be minted to user.
    function wrap(address user, uint256 amount, uint256 tokenPrice) external {
        erc1155.safeTransferFrom(
            msg.sender,
            address(this),
            OptionToken(erc1155).OPTION_TOKEN_ID(),
            amount,
            ""
        );
        uint256 tokensToMint = amount * tokenPrice;
        uint256 newTokenId = getNextTokenId();
        _mint(user, newTokenId, tokensToMint, "");
    }

    function unwrap(uint256 id, uint256 amount) external {
        require(balanceOf(msg.sender, id) >= amount, "Insufficient balance");
        _burn(msg.sender, id, amount);
        erc1155.safeTransferFrom(
            address(this),
            msg.sender,
            OptionToken(erc1155).OPTION_TOKEN_ID(),
            amount,
            ""
        );
    }

    function getNextTokenId() internal returns (uint256) {
        tokenId += 1;
        return tokenId;
    }
}
