pragma solidity ^0.4.23;

import "./University.sol";

contract Subject {

  struct Subject {
    string name;
    uint SubjectID;
    University university;
    string contents;
    //Subject[] equivalentSubjects; Un struct no se puede autoimplementar
    uint depth;
    address owner;
  }

}
