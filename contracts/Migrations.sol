// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

/**
 * Migrations is used by truffle to store contract deployment state.
 *    see:  https://trufflesuite.com/docs/truffle/getting-started/running-migrations/#initial-migration
 **/
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
