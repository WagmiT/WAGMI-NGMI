const Migrations = artifacts.require("Migrations");
const NGMI = artifacts.require("NGMI");
const WAGMI = artifacts.require("WAGMI");

module.exports = async function (deployer) {
  await deployer.deploy(Migrations);
  const NGMIContract = await deployer.deploy(NGMI);
  const NGMIInstance  = await NGMI.deployed();
  await deployer.deploy(WAGMI, NGMIContract.address);
  const WAGMIInstance = await WAGMI.deployed();
  await NGMIInstance.transferOwnership(WAGMIInstance.address);
};
