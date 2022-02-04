pragma solidity ^0.8.0;

import "./../v1/BaseTokenV1.sol";

// Minor Upgrade Scenario
contract BaseTokenV1_1 is BaseTokenV1 {
    
    bool public isToken; 

    function isItAToken() public view returns (bool) {
        return isToken;
    }

    function setToken() public {
        isToken = true;
    }

}