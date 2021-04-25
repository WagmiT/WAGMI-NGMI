const WAGMIContract = artifacts.require("WAGMI");
const NGMIContract = artifacts.require("NGMI");

contract("WAGMI", (accounts) => {
  it("Should mint NGMI when WAGMI being transferred", async () => {
    const WAGMI = await WAGMIContract.deployed();
    const NGMI = await NGMIContract.deployed();
    const from = accounts[0];
    const to = accounts[1];
    await WAGMI.transfer(to, "1000");
    assert.equal((await WAGMI.balanceOf(to)).toString(), "900");
    assert.equal((await NGMI.balanceOf(from)).toString(), "100");
  });

  it("Should not allow non owner to mint token", async () => {
    const NGMI = await NGMIContract.deployed();
    await NGMI.mint(accounts[1], "10").then(() => {
      throw new Error("It doesn't throw error");
    }).catch(err => {
      assert.equal(err.message, "Returned error: VM Exception while processing transaction: revert Ownable: caller is not the owner -- Reason given: Ownable: caller is not the owner.")
    })
  })
});
