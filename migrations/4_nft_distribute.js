const NGMINFT = artifacts.require("NGMINFT");
const distribution = require("../distribution.json");

module.exports = async function (deployer) {
  const NGMINFTInstance = await NGMINFT.deployed();
  const count = distribution.length / 20;
  for (let i = 0; i < count; i++) {
    console.log(distribution.slice(i * 20, i * 20 + 20));
    NGMINFTInstance.createNFTs(distribution.slice(i * 20, i * 20 + 20));
  }
};
