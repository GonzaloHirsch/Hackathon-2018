var University = artifacts.require("./University.sol");
var Administrator = artifacts.require("./Administrator.sol");

module.exports = function(deployer) {
  deployer.deploy(University);
  deployer.deploy(Administrator);
};
