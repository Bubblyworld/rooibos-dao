// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract Migrations {
    address public admin;
    uint public last_completed_migration;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin);
        _;
    }

    function setCompleted(uint completed) external onlyAdmin {
        last_completed_migration = completed;
    }
}
