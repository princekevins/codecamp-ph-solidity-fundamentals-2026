// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AddressBook {

    // TODO 1: Tạo struct Entry gồm:
    //  - aliasName: tên alias
    //  - contact: địa chỉ hoặc thông tin liên hệ
    struct Entry {
        string aliasName;
        string contact;
    }

    // TODO 2: Tạo mapping sao cho:
    //  Mỗi user (msg.sender) có một danh sách Entry của riêng họ
    mapping(address => Entry[]) private userEntries;

    // TODO 3: Viết hàm addEntry(aliasName, contact)
    //  - Thêm một Entry mới vào danh sách của msg.sender
    //  - Dùng push để thêm phần tử
    function addEntry(string memory aliasName, string memory contact) public {
        // code here
    }

    // TODO 4: Viết hàm getEntries()
    //  - Trả về toàn bộ danh sách Entry của msg.sender
    //  - Đây là hàm view
    function getEntries() public view returns (Entry[] memory) {
        // code here
    }

    // TODO 5: Viết hàm findByAlias(aliasName)
    //  - Duyệt qua toàn bộ danh sách của msg.sender
    //  - So sánh alias bằng keccak256(bytes(...))
    //  - Nếu tìm thấy → return Entry tương ứng
    //  - Nếu KHÔNG tìm thấy → return Entry("", "")
    function findByAlias(string memory aliasName)
        public
        view
        returns (Entry memory)
    {
        // code here
    }

    // TODO 6: Viết hàm removeByAlias(aliasName)
    //  - Duyệt danh sách userEntries[msg.sender]
    //  - Khi tìm thấy alias cần xoá, dùng kỹ thuật "swap-and-pop":
    //      + ghi đè phần tử cần xoá bằng phần tử cuối
    //      + pop() để xoá phần tử cuối
    //  - Thoát vòng lặp sau khi xoá
    function removeByAlias(string memory aliasName) public {
        // code here
    }
}
