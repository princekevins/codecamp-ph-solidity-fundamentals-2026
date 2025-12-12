// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Lottery {
    address public owner;
    uint public ticketPrice;
    uint public lotteryEndTime;
    address[] public players;

    constructor(uint _ticketPrice, uint _durationInSeconds) {
        owner = msg.sender;
        ticketPrice = _ticketPrice;
        lotteryEndTime = block.timestamp + _durationInSeconds;
    }

    // TODO 1: modifier onlyOwner và lotteryActive

    // TODO 2: hàm buyTicket() payable, chỉ chạy khi còn thời gian
    // Kiểm tra msg.value đúng bằng ticketPrice → push msg.sender vào players

    // TODO 3: hàm getPlayers() view trả về toàn bộ mảng

    // TODO 4: hàm pickWinner() chỉ owner gọi được, chỉ sau khi hết thời gian
    // Random chọn index = keccak256(block.prevrandao, block.timestamp, players.length) % players.length
    // Gọi hàm payWinner cho người trúng và xóa mảng players

    function payWinner(address winner) internal {
        payable(winner).transfer(address(this).balance);
    }
}