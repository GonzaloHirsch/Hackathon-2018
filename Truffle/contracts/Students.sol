pragma solidity ^0.4.19;

import "./Subjects.sol";
import "./University.sol";
import "./Administrator.sol";

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

  /*
    Function that creates a new student and adds it to the students of the university given
    Verifies if the sender is the university where it is going to be stored
  */
  function CreateNewStudent(address studentAddress, string name, uint universityId) external {
    //Check if the university is the one trying to create it
    require(msg.sender == allUniversities[universityId].owner);
    university.students.push(Student(studentAddress, name, SubjectData[], SubjectData[], university));
  }

  //TODO function to create subject data
  function CreateSubjectData(Student student, Subject subject, uint universityId, uint8 grade) external {
    require(allUniversities[universityId] != 0);
    require(university.subjects[]);

  }

}
