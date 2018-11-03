pragma solidity ^0.4.23;

import "./University.sol";
import "./Structures.sol";

contract SubjectsContract {

  struct Subject {
    string name;
    uint SubjectID;
    University university;
    string contents;
    Subject[] equivalentSubjects;
    uint depth;
    address owner;
  }
}
