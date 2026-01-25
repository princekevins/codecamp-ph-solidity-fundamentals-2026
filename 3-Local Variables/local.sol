// SPDX-License-Identifier: GPL-3.0
// Specifies the license under which this code is distributed (GNU General Public License v3.0)
pragma solidity ^0.8.0;

// Contract named 'Local' to demonstrate local and state variables
contract Local {
    // State variable: Permanently stored on the blockchain
    // - Costs gas to modify (20,000 gas for non-zero to zero, 5,000 gas otherwise in storage)
    // - Persists between function calls and transactions
    // - Accessible by anyone who interacts with the contract
    string public myName;

    // Pure function: Does not read or modify contract state
    // - Can only use local variables and input parameters
    // - Guaranteed to not change blockchain state
    // Returns a uint value stored in memory
    function getAge() pure public returns (uint) {
        // Local variable: Only exists during function execution
        // - Stored in memory (not on blockchain)
        // - No gas cost for declaration/usage (unlike storage variables)
        // - Automatically cleared when function execution ends
        uint age = 40;

        // Returns the local variable value
        // - Return values are copied from memory to the caller
        return age;
    }

    // Public function that modifies contract state
    // - Will cost gas when called (modifies storage)
    // - Can be called by anyone (no access restrictions)
    function updateName(string memory _newName) public {
        // Updates the state variable
        // - This operation costs gas (storage write)
        // - Change will be permanent on the blockchain
        myName = _newName;

        // Note: No return value specified
        // - Function executes transactionally but returns nothing
    }
}