const WAGMI = artifacts.require("WAGMI");
const BigNumber = require("bignumber.js");

/**
 * @type {Array<String>}
 */
const addresses = require("../distribution.json");

module.exports = async function (deployer) {
  const deployerAddress = deployer.provider.address;
  const WAGMIInstance = await WAGMI.deployed();
  const currentAmount = await WAGMIInstance.balanceOf(deployerAddress);
  const distributedAmount = new BigNumber(currentAmount.toString()).div(
    addresses.length
  );

  await Promise.all(
    addresses.map(async (address) => {
      return new Promise((resolve, reject) => {
        WAGMIInstance.transfer(address, distributedAmount)
          .on("confirmation", () => {
            resolve()
          }).on("error", () => {
            reject()
          })
      });
    })
  );
};
