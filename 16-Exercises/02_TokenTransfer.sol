// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TokenTransfer {
    // TODO 1: Tạo mapping lưu số dư token
    mapping(address => uint256) public balances;

    // TODO 2: Tạo biến owner lưu người deploy hợp đồng
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // TODO 3: Chỉ owner mới được mint, tăng balances[to] lên amount
    function mint(address to, uint256 amount) public {
        // require chỉ owner
        // balances[to] += amount;
    }

    // TODO 4: Viết hàm transfer thông thường
    // Kiểm tra đủ tiền → trừ người gửi → cộng người nhận
    function transfer(address to, uint256 amount) public {
        // code here
    }
}
