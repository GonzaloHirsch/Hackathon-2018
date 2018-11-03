pragma solidity ^0.4.19

import "./Subjects.sol";
import "./Students.sol";

contract UniversityContract {
  struct University {
    address owner;
    Subject[] subjects;
    string name;
    Student[] students;
  }

function createSubject(string name, University university, string contents, uint16 depth, address subjectOwner) {
  subjects.push(new Subject())
}


}
