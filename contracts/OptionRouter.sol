// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./Aggregator.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract OptionRouter {
    Aggregator public aggregator;
    IERC20 public stableCoin;

    constructor(Aggregator _aggregator, IERC20 _stableCoin) {
        aggregator = _aggregator;
        stableCoin = _stableCoin;
    }

    function getAggregator() public view returns (Aggregator) {
        return aggregator;
    }

    function buyOption(
        string memory asset,
        uint256 amount,
        bool,
        uint256 strike,
        uint256 maturity
    ) public payable {
        // Transfer the stable coin to the contract
        stableCoin.transferFrom(msg.sender, address(this), amount);

        // Execute the buy order on Premia
    }

    function sellOption(uint256 optionId) public {}
}
