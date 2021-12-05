// SPDX-License-Identifier: MIT
pragma solidity 0.8.1;


contract ProxyStorage {
    address public admin;
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
        admin = msg.sender;
        upgradeTo(_implementation);
    }

    modifier ifAdmin() {
        if (msg.sender == admin) {
            _;
        } else {
            _delegate(); // fallback
        }
    }

    // Now only admin can call upgradeTo
    function upgradeTo(address _implementation) public ifAdmin {
        implementation = _implementation;
    }

    // Problem 2: Solved! with ifAdmin modifier. Now all EOA's that are not the admin with only use the function in the logic contract
    // and the admin will always talk to the proxy contract. This has removed the function ambiguity and created "Transparency"
    function count() public ifAdmin {
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


    fallback() payable external ifAdmin {
        _delegate();
    }

    receive() payable external ifAdmin {
        _delegate();
    }
}