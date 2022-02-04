pragma solidity ^0.8.0;

import "../v3/AUDCv3.sol";
import "./BaseTokenV3.sol";

contract AUDCv4 is AUDCv3, BaseTokenV3 {

    function initializeV4() public {
        version = "4.0";
    }

    // function _beforeTokenTransfer(address from, address to, uint256 amount) internal override(AUDCv2, BaseTokenV2) {}

}