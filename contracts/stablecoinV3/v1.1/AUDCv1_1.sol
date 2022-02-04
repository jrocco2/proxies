pragma solidity ^0.8.0;

import "./BaseTokenV1_1.sol";
import "../v1/AUDCv1.sol";

contract AUDCv1_1 is AUDCv1, BaseTokenV1_1 {

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

}