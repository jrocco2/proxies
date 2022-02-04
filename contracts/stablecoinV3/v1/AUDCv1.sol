pragma solidity ^0.8.0;

import "./BaseTokenV1.sol";

contract AUDCv1 is BaseTokenV1 {

    string public version;
    /**
     * @notice Initalise imported libraries and token specific details such as
     * token name and symbol
     *
     * Requirements:
     * - Must only be called once like a constructor. 
     */

    function initialize() public initializer {
        __ERC20_init("Aussie Dollar Coin", "AU$DC");
        __ERC20Burnable_init();
        __Pausable_init();
        __Ownable_init();
        __UUPSUpgradeable_init();

        version = "1";
    }

}