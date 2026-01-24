# Solidity Smart Contract Learning Repository


## Highlights

### Introduction to Solidity

Learn the fundamentals of Solidity, including how to set up your development environment and write your first smart contract.

```solidity
pragma solidity ^0.8.0;

contract HelloWorld {
    string public greet = "Hello, World!";
}
```

### Data Types and Variables

Understand different data types and how to declare variables in Solidity.

```solidity
contract DataTypes {
    uint public myUint = 1;
    string public myString = "Hello";
    address public myAddress = msg.sender;
}
```

### Functions and Modifiers

Explore how to define functions, use function modifiers, and understand their significance.

```solidity
contract Functions {
    uint public myNumber;

    function setNumber(uint _number) public {
        myNumber = _number;
    }

    function getNumber() public view returns (uint) {
        return myNumber;
    }
}
```

### Inheritance and Interfaces

Dive into contract inheritance and interface implementation to create more modular and reusable code.

```solidity
contract Parent {
    function sayHello() public pure returns (string memory) {
        return "Hello from Parent";
    }
}

contract Child is Parent {
    function greet() public pure returns (string memory) {
        return sayHello();
    }
}
```

## Project Structure

This repo is organized by topic folders:

- `1-Intro`
- `2-State Variables`
- `3-Local Variables`
- `4-Function`
- `5-Constructor`
- `6-Data Types`
- `7-Array`
- `8-Loops`
- `9-Conditionals`
- `10-Struct`
- `11-Mapping`
- `12-Storage Locations`
- `13-Global Variables`
- `14- Contract Balance`
- `15-Visibility`
- `16-Exercises`

## Learning Path

Follow folders in order from `1-Intro` to `16-Exercises`. Each folder contains simple examples for the topic, with `16-Exercises` providing TODO-based practice.

## How to Run Each Folder (1-16)

There is no single "run" command for the entire repo. Each `.sol` file is a separate contract that you compile and deploy.

### Using Remix (Recommended)

1. Open Remix: https://remix.ethereum.org
2. Create a workspace and import the folder you want (e.g., `7-Array`).
3. Open a `.sol` file in that folder.
4. Set the compiler version to match the file `pragma`.
5. Compile and deploy.
6. Interact with the contract functions in the Remix UI.

Repeat the same steps for each folder and file you want to try.

### Using Hardhat (Local)

1. Copy one folder at a time into `contracts/` (for example `7-Array/`).
2. Compile with `npx hardhat compile`.
3. Create a script to deploy and interact with a specific contract.

Example script outline:

```javascript
// scripts/run.js
const { ethers } = require("hardhat");

async function main() {
  const Contract = await ethers.getContractFactory("ContractNameHere");
  const contract = await Contract.deploy();
  await contract.waitForDeployment();
  console.log("Deployed:", await contract.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
```

Run it with:

```bash
npx hardhat run scripts/run.js
```

Repeat by swapping the folder and contract name you want to test.

## Setup and Run in Remix

Remix is a browser-based IDE, so there is nothing to install to compile or run these contracts.

### What you need

- A modern web browser (Chrome, Firefox, or Edge).
- Optional: MetaMask if you want to deploy to a testnet. For local testing, Remix VM is enough.

### Steps

1. Open Remix: https://remix.ethereum.org
2. Create a workspace:
   - Use **File explorers > Workspaces > Create** and name it (e.g., `solidity-basics`).
3. Add the contracts:
   - Drag and drop the folder(s) from this repo into the Remix file explorer, or
   - Copy the `.sol` files into matching folders in Remix.
4. Compile:
   - Open the **Solidity Compiler** tab.
   - Set the compiler version that matches the `pragma` in the file.
   - Click **Compile**.
5. Deploy and run:
   - Open the **Deploy & Run Transactions** tab.
   - Choose **Remix VM** as the environment for local testing.
   - Click **Deploy**, then interact with the functions below.

### Dependencies

- None required for Remix-only usage.

## Local Setup with Hardhat

Use this if you want to compile and test locally with Node.js.

### Requirements

- Node.js 18+ and npm (install from https://nodejs.org)

### Install and Initialize

Run these commands from the repo root:

```bash
npm init -y
npm install --save-dev hardhat
npx hardhat init
```

### Add Contracts

- Copy the folder(s) you want into the `contracts/` directory, or
- Move all `.sol` files into `contracts/` and keep the folder structure.

### Compile

```bash
npx hardhat compile
```

### Run a Script (Optional)

Create a script in `scripts/` and run:

```bash
npx hardhat run scripts/yourScript.js
```

## Exercises

The `16-Exercises` folder contains TODO-based practice files. Start with `01_AddressBook.sol` and work in order.

## Testing

No automated tests are included. Use Remix or Hardhat to manually deploy and interact.

## Contributing

Contributions are welcome for typos, clarity improvements, or new examples. Keep changes small and focused.

## License

Add a license file if you plan to distribute or reuse this material.


