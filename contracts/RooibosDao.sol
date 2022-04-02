// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/access/AccessControl.sol";

contract RooibosDao is AccessControl {
    address public admin;
    bytes32 public constant PROPOSER_ROLE = keccak256("PROPOSER");
    bytes32 public constant VOTER_ROLE = keccak256("VOTER");

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin);
        _;
    }

    modifier onlyProposer() {
        require(hasRole(PROPOSER_ROLE, msg.sender));
        _;
    }

    modifier onlyVoter() {
        require(hasRole(VOTER_ROLE, msg.sender));
        _;
    }

    receive() external payable {
        // TODO: do something when people pay us
    }

    function makeProposer(address account) external onlyAdmin {
        if (!hasRole(PROPOSER_ROLE, account)) {
            _setupRole(PROPOSER_ROLE, account);

        }
    }
}
