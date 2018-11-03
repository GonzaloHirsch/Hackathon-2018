pragma solidity ^0.4.23;

import "./Subjects.sol";
import "./Students.sol";
import "./Administrator.sol";

contract University {

  struct University {
    address owner;
    uint UniversityID;
    Subject[] subjects;
    uint SubjectCount;
    string name;
    mapping (address => Student) walletToStudent;
  }

  function createSubject(string name, uint universityID, string contents, uint16 depth, address subjectOwner) {
    require(AdministratorContract.allUniversities[universityID] != 0);
    require(msg.sender == AdministratorContract.allUniversities[universityID].owner);

    AdministratorContract.allUniversities[universityID].subjects.push(Subject(name, AdministratorContract.allUniversities[universityID].SubjectCount, AdministratorContract.allUniversities[universityID], contents, depth, subjectOwner));
    AdministratorContract.allUniversities[universityID].SubjectCount++;
  }
}
