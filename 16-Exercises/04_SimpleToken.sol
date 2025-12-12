// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleToken {
    string public name;
    string public symbol;
    uint8 public decimals = 18;
    uint256 public totalSupply;

    // TODO 1: mapping balanceOf và allowance (2 chiều)

    // TODO 2: event Transfer và Approval

    constructor(string memory _name, string memory _symbol, uint256 _totalSupply) {
        name = _name;
        symbol = _symbol;
        // TODO 3: totalSupply = _totalSupply * 10**decimals
        // Gán hết cho msg.sender và emit Transfer từ address(0)
    }

    // TODO 4: hàm transfer thông thường (có require + emit)

    // TODO 5: hàm approve (cập nhật allowance + emit Approval)

    // TODO 6: hàm transferFrom
    // Kiểm tra balance của from và allowance → trừ cả 2 → chuyển tiền → emit Transfer
}