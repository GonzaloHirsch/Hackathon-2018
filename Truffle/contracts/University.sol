pragma solidity ^0.4.23;

import "./Structures.sol";

contract UniversityContract {

  struct University {
    address owner;
    uint UniversityID;
    Subject[] subjects;
    uint SubjectCount;
    string name;
    mapping (address => Student) walletToStudent;
  }

  function createSubject(string name, uint universityID, string contents, uint16 depth, address subjectOwner) {
    require(allUniversities[universityID] != 0);
    require(msg.sender == allUniversities[universityID].owner);

    subjects.push(Subject(name,SubjectCount, universities[universityID], contents, depth, subjectOwner));
    SubjectCount++;
  }
}
