// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Election {
    // TODO 1: struct Candidate có id, name, voteCount

    // TODO 2: mapping(uint => Candidate) public candidates
    // mapping(address => bool) public voters
    // uint public candidatesCount và totalVotes
    // address public admin (gán trong constructor)

    // TODO 3: event CandidateAdded và VoteCast

    // TODO 4: modifier onlyAdmin

    // TODO 5: hàm addCandidate(string memory _name) chỉ admin gọi được
    // Tăng candidatesCount, lưu candidate mới, emit event

    // TODO 6: hàm vote(uint _candidateId)
    // Kiểm tra chưa vote, id hợp lệ → đánh dấu đã vote → tăng voteCount → emit

    // TODO 7: hàm getCandidate trả về name và voteCount

    // TODO 8: hàm getWinner() trả về 2 mảng: tên và số phiếu của tất cả người thắng (có thể hòa)
    // Gợi ý: tìm max vote trước → đếm số người đạt max → tạo mảng → fill

    // TODO 9: hàm getAllCandidates()
    // Trả về toàn bộ danh sách Candidate[]
    // Gợi ý:
    // - Tạo một mảng mới có kích thước candidatesCount
    // - Duyệt từ 1 → candidatesCount
    // - Gán từng candidate vào mảng
    // - return mảng này
}