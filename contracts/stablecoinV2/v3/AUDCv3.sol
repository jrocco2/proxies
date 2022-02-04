pragma solidity ^0.8.0;

import "./../v2/AUDCv2.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20FlashMintUpgradeable.sol";

contract AUDCv3 is AUDCv2 { 
    
    function initializeV3() public {
        version = "3.0";
    }

}