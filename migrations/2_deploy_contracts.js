const { deployProxy } = require("@openzeppelin/truffle-upgrades");
const RooibosDao = artifacts.require("RooibosDao");
const RooibosToken = artifacts.require("RooibosToken");

module.exports = async function (deployer) {
  await deployer.deploy(RooibosToken);
  const token = await RooibosToken.deployed();

  await deployProxy(RooibosDao, [token.address], { deployer });
};
