// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/RooibosDao.sol";

// Example of testing contracts directly in solidity.
contract TestRooibosDao {
    function testNonZeroAdmin() public {
        RooibosDao rooibosDao = RooibosDao(DeployedAddresses.RooibosDao());
        uint160 admin = uint160(rooibosDao.admin());

        Assert.notEqual(admin, 0, "Admin address should be non-zero.");
    }
}

