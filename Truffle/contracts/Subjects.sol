pragma solidity ^0.4.19;

contract SubjectsContract {

  struct Subject {
    string name;
    University university;
    string contents;
    Subject[] equivalentSubjects;
    uint16 depth;
    address owner
  }

  function CreateNewSubject(string name, University university, string contents, uint16 depth, address subjectOwner) returns (Subject) {
    
  }

}
