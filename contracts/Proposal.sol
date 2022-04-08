// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

/** 
 * Encapsulates a proposal for a state change in the RooibosDao contract. This
 * could be something like proposing to invest a certain amount of money in 
 * Rooibos in return for governance tokens, for instance. Owners of governance
 * tokens can stake them against a proposal to signal their support or protest.
 **/
abstract contract Proposal {
    /**
     * Stakes a certain amount of the caller's governance tokens against the
     * proposal, either in support (is_support=false), or in protest against
     * the proposal (is_support=true).
     **/
    function vote(uint amount) virtual external;

    /**
     * The RooibosDao contract will execute the code in this function with a
     * delegatecall if the contract has more stake in support than in protest.
     **/
    function execute() virtual external;
}
