// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "./MyToken.sol";

contract MyTokenV2 is MyToken {
    /// @custom:oz-upgrades-unsafe-allow constructor
    // constructor() initializer {}
    uint256 public myInt;
    function initializeV2() public virtual {
        myInt = 250;
    }

    function _authorizeUpgrade(address newImplementation)
        internal
        onlyOwner
        override
    {}
}