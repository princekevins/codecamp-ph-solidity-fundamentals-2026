// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract HelloWorld {
    string public greet = "Hello, World!";

    function getGreet() external view returns (string memory) {
        return greet;
    }
}