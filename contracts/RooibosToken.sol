// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/draft-ERC20Permit.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";

/** 
 * RooibosToken is used to vote on proposals in RooisbosDao. It can be
 * traded as a fungible ERC20 token, and so we use the ERC20Votes interface
 * to keep track of user's balances at the time a proposal is created. This
 * means users cannot vote on a proposal, transfer the tokens, and vote again.
 *    see: https://docs.openzeppelin.com/contracts/4.x/governance
 **/
contract RooibosToken is AccessControl, ERC20, ERC20Permit, ERC20Votes {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    constructor() ERC20("Rooibos", "RGT") ERC20Permit("Rooibos") {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(MINTER_ROLE, msg.sender);
    }

    function mint(address to, uint256 amount)
        public
        onlyRole(MINTER_ROLE)
    {
        _mint(to, amount);
    }

    /******************
     **  OVERRIDES:  **
     ******************/

    function _afterTokenTransfer(address from, address to, uint256 amount)
        internal
        override(ERC20, ERC20Votes)
    {
        super._afterTokenTransfer(from, to, amount);
    }

    function _mint(address to, uint256 amount)
        internal
        override(ERC20, ERC20Votes)
    {
        super._mint(to, amount);
    }

    function _burn(address account, uint256 amount)
        internal
        override(ERC20, ERC20Votes)
    {
        super._burn(account, amount);
    }
}
