// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title Integer Types Demo
 * @dev Demonstrates the use of integer types in Solidity with best practices
 * @notice Shows different integer sizes, operations, and safe usage patterns
 * @author Your Name
 */
contract IntegerTypes {
    // ========== STATE VARIABLES ========== //
    // Using descriptive names to avoid shadowing and improve clarity

    /**
     * @dev Default unsigned 256-bit integer (state variable)
     * @notice Range: 0 to 2^256-1 (~1.15e77)
     * @notice uint256 is the default when using just 'uint'
     */
    uint256 public stateValueA;  // Renamed from 'a' to avoid shadowing

    /**
     * @dev Default signed 256-bit integer (state variable)
     * @notice Range: -2^255 to 2^255-1 (~±5.79e76)
     */
    int256 public stateValueB;  // Renamed from 'b' for consistency

    /**
     * @dev Signed 256-bit integer initialized to 127
     */
    int256 public count = 127;

    /**
     * @dev Signed 16-bit integer initialized to -1233
     * @notice Range: -32,768 to 32,767
     */
    int16 public count2 = -1233;

    /**
     * @dev Signed 32-bit integer initialized to -123456
     * @notice Range: -2,147,483,648 to 2,147,483,647
     */
    int32 public count3 = -123456;

    /**
     * @dev Unsigned 256-bit integer initialized to 23
     */
    uint256 public num = 23;

    /**
     * @dev Unsigned 8-bit integer initialized to maximum value (255)
     * @notice Range: 0 to 255
     */
    uint8 public num2 = 255;

    /**
     * @dev Unsigned 16-bit integer initialized to 26456
     * @notice Range: 0 to 65,535
     */
    uint16 public num3 = 26456;

    // ========== INTEGER TYPE RANGES REFERENCE ========== //
    /*
     * Unsigned Integers (uint):
     * uint8:    0 to 255 (2^8 - 1)
     * uint16:   0 to 65,535 (2^16 - 1)
     * uint32:   0 to 4,294,967,295 (2^32 - 1)
     * ...
     * uint256:  0 to 2^256 - 1 (~1.15e77)

     * Signed Integers (int):
     * int8:    -128 to 127 (-2^7 to 2^7 - 1)
     * int16:   -32,768 to 32,767 (-2^15 to 2^15 - 1)
     * int32:   -2,147,483,648 to 2,147,483,647 (-2^31 to 2^31 - 1)
     * ...
     * int256:  -2^255 to 2^255 - 1 (~±5.79e76)
     */

    // ========== FUNCTIONS ========== //

    /**
     * @dev Adds two unsigned integers
     * @param firstValue First operand (renamed from 'x' for clarity)
     * @param secondValue Second operand (renamed from 'y' for clarity)
     * @return Sum of firstValue and secondValue
     * @notice Uses Solidity 0.8.0+ built-in overflow protection
     */
    function add(uint256 firstValue, uint256 secondValue) public pure returns (uint256) {
        return firstValue + secondValue;
    }

    /**
     * @dev Compares two unsigned integers
     * @param firstValue First value to compare (renamed from 'a' to avoid shadowing)
     * @param secondValue Second value to compare (renamed from 'b' for consistency)
     * @return true if firstValue > secondValue, false otherwise
     */
    function isGreater(uint256 firstValue, uint256 secondValue) public pure returns (bool) {
        return firstValue > secondValue;
    }

    /**
     * @dev Safely converts a uint256 to uint8 with overflow protection
     * @param largeNumber Value to convert
     * @return Converted value
     * @notice Reverts if input exceeds uint8 range (255)
     */
    function safeConvertToUint8(uint256 largeNumber) public pure returns (uint8) {
        require(largeNumber <= 255, "IntegerTypes: value exceeds uint8 range");
        return uint8(largeNumber);
    }

    /**
     * @dev Adds two numbers with explicit overflow check
     * @param firstValue First value
     * @param secondValue Second value
     * @return Sum of firstValue and secondValue
     * @notice Demonstrates manual overflow check (redundant in 0.8.0+ but educational)
     */
    function explicitSafeAdd(uint256 firstValue, uint256 secondValue) public pure returns (uint256) {
        require(secondValue <= type(uint256).max - firstValue, "IntegerTypes: addition overflow");
        return firstValue + secondValue;
    }

    /**
     * @dev Demonstrates safe type conversions between different integer sizes
     * @return Tuple of converted values (uint8, uint16, uint32)
     * @notice Shows how to safely convert between integer types
     */
    function demonstrateTypeConversions() public pure returns (uint8, uint16, uint32) {
        uint256 largeNumber = 250;  // Value that fits in all target types

        uint8 small8 = uint8(largeNumber);
        uint16 small16 = uint16(largeNumber);
        uint32 small32 = uint32(largeNumber);

        return (small8, small16, small32);
    }

    /**
     * @dev Updates the stateValueA variable
     * @param newValue New value to set
     * @notice Demonstrates state variable modification
     */
    function updateStateValueA(uint256 newValue) public {
        stateValueA = newValue;
    }

    /**
     * @dev Updates the stateValueB variable
     * @param newValue New value to set
     */
    function updateStateValueB(int256 newValue) public {
        stateValueB = newValue;
    }
}