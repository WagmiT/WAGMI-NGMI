const NGMINFT = artifacts.require("NGMINFT");
// const distribution = require("../distribution.json")

module.exports = async function (deployer) {
  await deployer.deploy(NGMINFT);
};
