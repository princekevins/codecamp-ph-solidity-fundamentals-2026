// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title Storage vs Memory Demonstration
 * @dev Shows the difference between storage and memory data locations in Solidity
 * @notice Demonstrates how assignments behave differently based on data location
 */
contract StorageMemoryDemo {
    // ========== STATE VARIABLES ========== //

    string[] public student = ["Alice", "Bob", "Charlie"];

    struct Person {
        string name;
        uint256 age;
    }

    Person public person = Person("Alice", 25);

    // ========== DEMONSTRATION FUNCTIONS ========== //

    /**
     * @dev Demonstrates memory data location behavior
     * @notice Creates a copy of the storage array in memory
     * @notice Modifications to the memory copy don't affect storage
     * @dev Data Location: memory
     * - Creates an independent copy of the array (gas cost: ~2100 gas for 3 elements)
     * - Changes to the copy don't affect original storage
     * - Memory arrays are temporary and exist only during execution
     * @dev State Mutability: view (only reads from storage, doesn't modify it)
     * @dev Use Case: When you need to work with array data without modifying storage
     */
    function demonstrateMemoryBehavior() public view {
        // Creates a new independent copy in memory
        // Gas cost: ~2100 gas for copying 3 elements (3 slots × 700 gas)
        string[] memory studentsCopy = student;

        // Modify the memory copy (doesn't affect storage)
        studentsCopy[0] = "David";

        // After execution:
        // - studentsCopy = ["David", "Bob", "Charlie"] (temporary)
        // - student remains ["Alice", "Bob", "Charlie"] (persistent)
    }

    /**
     * @dev Demonstrates storage data location behavior
     * @notice Creates a reference to the storage array
     * @notice Modifications affect the original storage array
     * @dev Data Location: storage
     * - Creates a reference to the existing storage array (gas cost: ~40 gas)
     * - Changes through the reference modify the original storage
     * - Storage modifications are expensive (~20,000 gas per write)
     * @dev State Mutability: (default) - modifies storage
     * @dev Use Case: When you need to modify the original storage array
     * @dev WARNING: Directly modifies contract state
     */
    function demonstrateStorageBehavior() public {
        // Creates a reference to the existing storage array
        string[] storage studentsRef = student;

        // Modify through the reference (affects storage)
        studentsRef[0] = "David";

        // After execution:
        // - studentsRef and student both = ["David", "Bob", "Charlie"]
    }

    /**
     * @dev Returns the current state of the student array
     * @return The current student array from storage
     * @dev State Mutability: view (only reads from storage)
     * @dev Gas Cost: ~700 gas for copying the array to memory
     */
    function getStudentArray() public view returns (string[] memory) {
        return student;
    }

    /**
     * @dev Demonstrates memory vs storage with structs
     * @notice Shows how complex types behave with different data locations
     * @dev State Mutability: (default) - modifies storage for the age field
     * @dev Gas Implications:
     * - Struct copy to memory: ~700 gas
     * - Storage modification: ~20,000 gas for the age field
     */
    function demonstrateStructBehavior() public {
        // Memory copy - creates independent copy
        Person memory personCopy = person;
        personCopy.name = "Bob";  // Only affects the copy

        // Storage reference - modifies original
        Person storage personRef = person;
        personRef.age = 30;  // Affects the stored person
    }

    /**
     * @dev Demonstrates gas costs of memory vs storage operations
     * @return memLength Length of the memory array (copied from storage)
     * @return firstElement First element of the storage array
     * @dev State Mutability: view (only reads from storage)
     * @dev Gas Analysis:
     * - Memory copy: ~2100 gas for 3-element array
     * - Storage read operations: ~200 gas total for length and element access
     */
    function demonstrateGasCosts() public view returns (uint256, string memory) {
        // Memory copy - expensive to create but cheap to read
        string[] memory memArray = student;
        uint256 memLength = memArray.length;

        // Storage reference - cheap to create and read
        string[] storage storageArray = student;
        string memory firstElement = storageArray[0];

        return (memLength, firstElement);
    }

    /**
     * @dev Resets the student array to its initial state
     * @dev State Mutability: (default) - modifies storage
     * @dev Gas Cost: ~40,000 gas (20k for each of 3 writes)
     */
    function resetStudentArray() public {
        student = ["Alice", "Bob", "Charlie"];
    }
}