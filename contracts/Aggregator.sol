// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "./OptionToken.sol";
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract Aggregator {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // This function connects to Premia and buys the option
    function buyOption(
        string memory asset,
        uint256 amount,
        bool,
        uint256 strike,
        uint256 maturity
    ) external {
        // Send this information to router which will connect to Premia
    }

    // Sell tokenised options held by user
    function sellOption(uint256 optionId) external {
        // Send this information to router which will connect to Premia
    }
}
