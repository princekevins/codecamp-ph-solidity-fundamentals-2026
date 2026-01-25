// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleBank {
    // TODO 1: Create a mapping to store the balance of each address
    // mapping(address => ?) public balances;
    mapping(address => uint256) public balances;
    address public immutable owner;

    constructor() payable {
        owner = msg.sender;
    }

    // TODO 2: Write a deposit function, require msg.value > 0
    function deposit() external payable {
    require(msg.value > 0, "Deposit amount must be greater than 0");
    balances[msg.sender] += msg.value;
    }

    // TODO 3: Write a function to view a person's balance
    function balanceOf(address user) external view returns (uint256) {
    return balances[user];
    }

    // TODO 4: Write a function to withdraw all of your money
    // Hint: get amount = balances[msg.sender] → set to 0 → transfer
    function withdraw() external {
    uint256 amount = balances[msg.sender];
    require(amount > 0, "Insufficient balance");
    balances[msg.sender] = 0;
    payable(msg.sender).transfer(amount);
    }

    // TODO 5: Write a function to view the total money in the contract
    function contractBalance() external view returns (uint256) {
    return address(this).balance;
    }
}