pragma solidity ^0.4.23;

contract StructuresContract {

  struct University {
    address owner;
    uint UniversityID;
    Subject[] subjects;
    uint SubjectCount;
    string name;
    mapping (address => Student) walletToStudent;
  }

  struct SubjectData {
    string name;
    University university;
    uint8 grade;
  }

  struct Student {
    address owner;
    string name;
    SubjectData[] attendedSubjects;
    SubjectData[] currentSubjects;
    University university;
  }

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
