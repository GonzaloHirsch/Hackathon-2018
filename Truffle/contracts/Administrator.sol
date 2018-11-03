pragma solidity ^0.4.23;

import "./Ownable.sol";
import "./Structures.sol";

contract AdministratorContract is Ownable {
  University[] allUniversities;
  uint universityCount = 0;

  function CreateUniversity(address owner, string name) external {
  	allUniversities[universityCount] = University(owner, universityCount, new Subject[], 0, name, new mapping (address => Student));
  	universityCount++;
  }
}
