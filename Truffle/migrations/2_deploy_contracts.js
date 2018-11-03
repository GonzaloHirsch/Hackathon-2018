const University = require('./University');
const Administator = artifacts.require("./Administator");
const Migrations = require('./Migrations');
const Subjects = require('./Subjects');


module.exports = function(deployer) {
  // deployment steps
  deployer.deploy(University);
  deployer.link(University,Subjects);
  deployer.deploy(Subjects);
  deployer.deploy(Administator);

  deployer.deploy(Migrations);


};
