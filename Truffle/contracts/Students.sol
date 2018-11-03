pragma solidity ^0.4.19;

import "./Subjects.sol";
import "./University.sol";

contract StudentsContract {

  struct Student {
    address owner;
    string name;
    SubjectData[] attendedSubjects;
    SubjectData[] currentSubjects;
    University university;
  }

  struct SubjectData {
    string name;
    University university;
    uint8 grade;
  }

}
