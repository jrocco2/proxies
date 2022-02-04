pragma solidity ^0.8.0;

import "./../v1.1/AUDCv1_1.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20FlashMintUpgradeable.sol";

contract AUDCv2 is AUDCv1_1, ERC20FlashMintUpgradeable { 
    
    // Add flashminting
    function initializeV2() public {
        version = "2.0";
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount) internal virtual override(AUDCv1, ERC20Upgradeable) {}

}