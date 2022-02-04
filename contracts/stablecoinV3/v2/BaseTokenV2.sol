pragma solidity ^0.8.0;

import "./../v1.1/BaseTokenV1_1.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20FlashMintUpgradeable.sol";

contract BaseTokenV2 is BaseTokenV1_1, ERC20FlashMintUpgradeable { 
    
    // Add flashminting
    function _beforeTokenTransfer(address from, address to, uint256 amount) internal virtual override(BaseTokenV1, ERC20Upgradeable) {}

}