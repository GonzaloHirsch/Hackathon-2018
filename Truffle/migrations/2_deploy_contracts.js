var University = artifacts.require("University");
var Administrator = artifacts.require("Administrator");

module.exports = function(deployer) {
  deployer.deploy(University);
  deployer.link(University, Administrator);
  deployer.deploy(Administrator);
};
