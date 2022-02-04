pragma solidity ^0.8.0;

import "../v1.1/AUDCv1_1.sol";
import "../../../base/v2/BaseTokenV2.sol";

contract AUDCv2 is AUDCv1_1, BaseTokenV2 {

    function initializeV2() public {
        version = "2.0";
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount) internal virtual override(BaseTokenV2, BaseTokenV1) {}

}