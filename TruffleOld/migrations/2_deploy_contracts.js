const University = artifacts.require('./University');
const Administator = artifacts.require("./Administator");
const Migrations = artifacts.require('./Migrations');
const Subjects = artifacts.require('./Subjects');
const Structures = artifacts.require('Structures');


module.exports = function(deployer) {
  // deployment steps

  deployer.deploy(Structures);
  deployer.link(Structures,Administator);
  deployer.deploy(University);
  deployer.deploy(Subjects);
  deployer.deploy(Administator);
  deployer.deploy(Migrations);


};
