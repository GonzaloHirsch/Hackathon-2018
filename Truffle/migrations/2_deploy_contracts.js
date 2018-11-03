var DecentralizedUniversity = artifacts.require("DecentralizedUniversity");
var University = artifacts.require("University");

module.exports = function(deployer) {
  deployer.deploy(DecentralizedUniversity);
  deployer.deploy(University);
};
