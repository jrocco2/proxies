pragma solidity ^0.8.0;

import "../v2/AUDCv2.sol";
import "../../../base/v2/BaseTokenV2.sol";

contract AUDCv3 is BaseTokenV2, AUDCv2 {

    function initializeV3() public {
        version = "3.0";
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount) internal override(AUDCv2, BaseTokenV2) {}

}