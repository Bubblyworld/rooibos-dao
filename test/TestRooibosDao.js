const RooibosDao = artifacts.require("RooibosDao");

contract("RooibosDao", accounts => {
  it("...should have non-zero admin address.", async () => {
    const rooibosDao = await RooibosDao.deployed();
    const adminAddr = await rooibosDao.admin();

    assert.notEqual(Number.parseInt(adminAddr), 0, "Admin address should be non-zero.");
  });
});
