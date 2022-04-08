const RooibosDao = artifacts.require("RooibosDao");

contract("RooibosDao", accounts => {
  it("...should have non-zero admin address.", async () => {
    const rooibosDao = await RooibosDao.deployed();
    const admin = await rooibosDao.admin();

    assert.notEqual(Number.parseInt(admin), 0, "Admin address should be non-zero.");
  });
});
