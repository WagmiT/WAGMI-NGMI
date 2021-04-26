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
  const distributedAmount = new BigNumber(3400000).times(
    new BigNumber(10).pow(18)
  );

  for (let i = 0; i < addresses.length; i++) {
    const address = addresses[i];
    WAGMIInstance.transfer(address, distributedAmount);
    await setTimeout(() => {}, 100);
    console.log(address);
  }
};
