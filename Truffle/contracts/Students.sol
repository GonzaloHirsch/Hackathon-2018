pragma solidity ^0.4.23;

import "./Subjects.sol";
import "./University.sol";
import "./Administrator.sol";
import "./Structures.sol";

contract StudentsContract {
  /*
    Function that creates a new student and adds it to the students of the university given
    Verifies if the sender is the university where it is going to be stored
  */
  function CreateNewStudent(address studentAddress, string name, uint universityId) external {
    //Check if the university is the one trying to create it
    require(msg.sender == allUniversities[universityId].owner);
    university.students.push(Student(studentAddress, name, SubjectData[], SubjectData[], university));
  }

  /*
    Function that creates a new subjectData and adds it to the students currentSubject.
  */
  function CreateSubjectData(address studentAddress, uint subjectId, uint universityId) external{
    require(allUniversities[universityId] != 0);
    require(allUniversities[universityId].subjects[subjectId] != 0);
    require(allUniversities[universityId].walletToStudent[studentAddress] != 0);

    Subject aux = allUniversities[universityId].subjects[subjectId];
    University auxUni = allUniversities[universityId];

    //Adds the subjectData to the currentSubjects array;
    allUniversities[universityId].walletToStudent[studentAddress].currentSubjects.push(SubjectData(aux.name, auxUni, 0));
  }

  function ValidateSubject(uint score) external{
    require
  }

}
