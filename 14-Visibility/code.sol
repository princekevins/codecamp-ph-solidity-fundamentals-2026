// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;  // Updated to modern Solidity version for security and features

/**
 * @title Function Visibility Demonstration
 * @dev Shows different function visibility modifiers in Solidity
 * @notice Demonstrates public, private, internal, and external visibility
 */
contract Demo {  // Contract names should be PascalCase

    /**
     * @dev Public function visible both internally and externally
     * @return Always returns 1
     * @notice Can be called:
     * - From within this contract
     * - From child contracts
     * - From other contracts
     * - From transactions
     */
    function f1() public pure returns (uint256) {
        return 1;
    }

    /**
     * @dev Private function visible only within this contract
     * @return Always returns 2
     * @notice Can be called:
     * - Only from within this contract
     * - NOT from child contracts
     * - NOT from other contracts
     * - NOT from transactions
     */
    function f2() private pure returns (uint256) {
        return 2;
    }

    /**
     * @dev Internal function visible within contract hierarchy
     * @return Always returns 3
     * @notice Can be called:
     * - From within this contract
     * - From child contracts
     * - NOT from other contracts
     * - NOT from transactions
     */
    function f3() internal pure returns (uint256) {
        // Note: Cannot call f2() here because f2() is private
        // If you need to call f2() from f3(), change f2() to internal
        return 3;
    }

    /**
     * @dev External function visible only outside the contract
     * @return Always returns 4
     * @notice Can be called:
     * - From other contracts (via this.f4())
     * - From transactions
     * - NOT from within this contract (without using this.f4())
     * - NOT from child contracts (without using this.f4())
     */
    function f4() external pure returns (uint256) {
        return 4;
    }
}

/**
 * @title Child Contract Demonstrating Inheritance
 * @dev Shows how different visibility types behave in inheritance
 */
contract ChildDemo is Demo {
    /**
     * @dev Calls internal function from parent contract
     * @notice Works because internal functions are accessible in child contracts
     */
    uint256 public child_var = f3();

    /**
     * @dev Attempts to call external function from parent
     * @notice This would fail because external functions can't be called directly internally
     * @notice Fixed by either:
     * 1. Changing f4() to public in parent contract (recommended)
     * 2. Using this.f4() to force external call
     * @dev Current solution: Changed to use this.f4() to demonstrate external call
     */
    uint256 public child_var2 = this.f4();

    /**
     * @dev Attempts to call private function from parent
     * @notice This would fail because private functions aren't accessible in child contracts
     * @notice Commented out to prevent compilation error
     * // uint256 public child_var3 = f2();
     */

    /**
     * @dev Calls public function from parent contract
     * @notice Works because public functions are fully accessible
     */
    uint256 public child_var4 = f1();
}

/**
 * @title Other Contract Demonstrating External Access
 * @dev Shows how to call functions from a separate contract
 */
contract OtherContract {
    Demo public obj;  // Instance of Demo contract

    /**
     * @dev Constructor creates instance of Demo contract
     */
    constructor() {
        obj = new Demo();
    }

    /**
     * @dev Calls public function from Demo contract
     * @notice Works because public functions are externally accessible
     */
    uint256 public cx = obj.f1();

    /**
     * @dev Calls external function from Demo contract
     * @notice Works because external functions are designed for external access
     */
    uint256 public cy = obj.f4();

    /**
     * @dev Demonstrates calling external function via instance
     * @return Value returned from f4()
     */
    function callExternalFunction() public view returns (uint256) {
        return obj.f4();
    }
}