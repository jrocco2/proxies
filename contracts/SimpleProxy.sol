// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract ProxyStorage {
    address public implementation;
    uint256 public counter;
}

// Problem 1: We need to import ProxyStorage into the Logic contract so storage slots match this is not efficent.
contract Logic is ProxyStorage {
    address public myAddress;
    uint public myUint;

    function setAddress(address _address) public {
        myAddress = _address;
    }

    function setMyUint(uint _uint) public {
        myUint = _uint;
    }

    function count() public {
        counter += 1;
    }

}

contract Proxy is ProxyStorage {

    constructor(address _implementation) {
        upgradeTo(_implementation);
    }

    function upgradeTo(address _implementation) public {
        implementation = _implementation;
    }

    // Problem 2: Functions in the Proxy and Logic contracts can "overlap" as is happening here with count().
    // This problem can happen when the (name + signature) or the function selector is the same.
    function count() public {
        counter += 5;
    }

    function _delegate() internal virtual {
        address _impl = implementation;

        assembly {
        let ptr := mload(0x40)
        calldatacopy(ptr, 0, calldatasize())
        let result := delegatecall(gas(), _impl, ptr, calldatasize(), 0, 0)
        let size := returndatasize()
        returndatacopy(ptr, 0, size)

        switch result
        case 0 { revert(ptr, size) }
        default { return(ptr, size) }
        }
    }


    fallback() payable external {
        _delegate();
    }

    receive() payable external {
        _delegate();
    }
}