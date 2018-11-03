pragma solidity ^0.4.23;

import "./Subjects.sol";
import "./University.sol";
import "./Administrator.sol";

contract Student {

  AdministratorContract administrator = new AdministratorContract();

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
  /*
    Function that creates a new student and adds it to the students of the university given
    Verifies if the sender is the university where it is going to be stored
  */
  function CreateNewStudent(address studentAddress, string name, uint universityId) external {
    //Check if the university is the one trying to create it
    require(administrator.allUniversities[universityId] != 0);
    require(msg.sender == administrator.allUniversities[universityId].owner);
    administrator.allUniversities[universityId].students.push(Student(studentAddress, name, SubjectData[], SubjectData[], administrator.allUniversities[universityId] ));
  }

  /*
    Function that creates a new subjectData and adds it to the students currentSubject.
  */
  function CreateSubjectData(address studentAddress, uint subjectId, uint universityId) external{
    require(administrator.allUniversities[universityId] != 0);
    require(administrator.allUniversities[universityId].subjects[subjectId] != 0);
    require(administrator.allUniversities[universityId].walletToStudent[studentAddress] != 0);

    Subject aux = administrator.allUniversities[universityId].subjects[subjectId];
    University auxUni = administrator.allUniversities[universityId];

    //Adds the subjectData to the currentSubjects array;
    administrator.allUniversities[universityId].walletToStudent[studentAddress].currentSubjects.push(SubjectData(aux.name, auxUni, 0));
  }

  function ValidateSubject(uint score) external{
  }

}
