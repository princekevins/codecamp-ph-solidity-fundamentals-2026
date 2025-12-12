// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleBank {
    // TODO 1: Tạo mapping để lưu số dư của từng địa chỉ
    // mapping(address => ?) public balances;
    address public immutable owner;

    constructor() payable {
        owner = msg.sender;
    }

    // TODO 2: Viết hàm nạp tiền (deposit), yêu cầu msg.value > 0
    function deposit() external payable {
        // code here
    }

    // TODO 3: Viết hàm xem số dư của một người
    function balanceOf(address user) external view returns (uint256) {
        // return ...
    }

    // TODO 4: Viết hàm rút toàn bộ tiền của mình
    // Gợi ý: lấy amount = balances[msg.sender] → set về 0 → transfer
    function withdraw() external {
        // code here
    }

    // TODO 5: Viết hàm xem tổng tiền trong hợp đồng
    function contractBalance() external view returns (uint256) {
        // return ...
    }
}
