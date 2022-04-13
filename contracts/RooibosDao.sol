// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts-upgradeable/governance/GovernorUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/governance/extensions/GovernorSettingsUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/governance/extensions/GovernorCountingSimpleUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/governance/extensions/GovernorVotesUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/governance/extensions/GovernorVotesQuorumFractionUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

/**
 * RooibosDao is the governance and treasury contract for the project. Handles
 * proposals for voting, determining when quorum has been achieved, storing the
 * project's cryptocurrency funds and other administrative tasks. All of the
 * voting related parameters (delay, quorum, time period etc) can be modified
 * via proposals.
 *    see: https://docs.openzeppelin.com/contracts/4.x/governance
 *    see: https://docs.openzeppelin.com/contracts/4.x/upgradeable
 **/
contract RooibosDao is Initializable, GovernorUpgradeable, 
    GovernorSettingsUpgradeable, GovernorCountingSimpleUpgradeable,
    GovernorVotesUpgradeable, GovernorVotesQuorumFractionUpgradeable {

    address public admin; // address of whoever deployed the contract

    function initialize(IVotesUpgradeable _token)
        initializer public
    {
        admin = msg.sender;

        __Governor_init("RooibosDao");
        __GovernorVotes_init(_token);
        __GovernorCountingSimple_init();
        __GovernorVotes_init(_token); // Repeat?
        __GovernorVotesQuorumFraction_init(4); // 4% required for quorum
    }

    // Function for creating proposal
    // Function for adjusting quorum fraction

    function adjustQuorum(uint256 quorumIn) internal {

    }

    /******************
     **  OVERRIDES:  **
     ******************/

    function votingDelay()
        public
        view
        override(IGovernorUpgradeable, GovernorSettingsUpgradeable)
        returns (uint256)
    {
        return super.votingDelay();
    }

    function votingPeriod()
        public
        view
        override(IGovernorUpgradeable, GovernorSettingsUpgradeable)
        returns (uint256)
    {
        return super.votingPeriod();
    }

    function quorum(uint256 blockNumber)
        public
        view
        override(IGovernorUpgradeable, GovernorVotesQuorumFractionUpgradeable)
        returns (uint256)
    {
        return super.quorum(blockNumber);
    }

    function getVotes(address account, uint256 blockNumber)
        public
        view
        override(IGovernorUpgradeable, GovernorVotesUpgradeable)
        returns (uint256)
    {
        return super.getVotes(account, blockNumber);
    }

    function proposalThreshold()
        public
        view
        override(GovernorUpgradeable, GovernorSettingsUpgradeable)
        returns (uint256)
    {
        return super.proposalThreshold();
    }
}
