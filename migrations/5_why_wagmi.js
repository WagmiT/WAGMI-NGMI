const WHY_WAGMI = artifacts.require("WhyWAGMI");

module.exports = async function(deployer) {
    await deployer.deploy(WHY_WAGMI, "0xcddb9f34d6a48e5d051561e6d9fbfc96050cd429");
}