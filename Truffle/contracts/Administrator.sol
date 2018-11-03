pragma solidity ^0.4.23;

import "./University.sol";
import "./Ownable.sol";

contract AdministratorContract is Ownable{
  University[] allUniversities;
  uint universityCount;

  function CreateUniversity(address owner, string name) external{
  	allUniversities[universityCount] = University(owner, universityCount, new Subject[], 0, name, new mapping (address => Student));
  	universityCount++;
  }
}
