pragma solidity ^0.8.0;

import "./../v1.1/BaseTokenV1_1.sol";
import "./Blacklistable.sol";

contract BaseTokenV2 is BaseTokenV1_1, Blacklistable { 
    
    // Add Blacklisting
    function updateBlacklister(address _newBlacklister) external override onlyOwner {
        require(
            _newBlacklister != address(0),
            "Blacklistable: new blacklister is the zero address"
        );
        blacklister = _newBlacklister;
        emit BlacklisterChanged(blacklister);
    }

    

}