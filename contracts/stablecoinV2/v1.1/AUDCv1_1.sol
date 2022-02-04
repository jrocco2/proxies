pragma solidity ^0.8.0;

import "./../v1/AUDCv1.sol";

// Minor Upgrade Scenario
contract AUDCv1_1 is AUDCv1 {
    
    bool public isToken; 
    uint256 audIdentifier; // Now required by law

    /**
     * @notice Initalise imported libraries and token specific details such as
     * token name and symbol
     *
     * Requirements:
     * - Must only be called once like a constructor. 
     */
    function initializeV1_1() public initializer {
        version = "1.1";
        audIdentifier = 123456;
    }

    function isItAToken() public view returns (bool) {
        return isToken;
    }

    function setToken() public {
        isToken = true;
    }

}