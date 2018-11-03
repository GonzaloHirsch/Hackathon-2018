pragma solidity ^0.4.24;

contract Structure {
  struct University {
    address owner;
    uint UniversityID;
    Subject[] subjects;
    uint SubjectCount;
    string name;
    mapping (address => Student) walletToStudent;
  }

  struct Student{
		address owner;
		string name;
		University university;
		SubjectData[] attendedSubjects;
    	SubjectData[] currentSubjects;
	}

  struct SubjectData{
		string name;
		University university;
		uint grade;
	}

  struct Subject{
    address owner;
    string name;
    string contents;
    uint SubjectID;
    uint depth;
    University university;
  }
}

contract ContractsInterface {
  function SetAdministrator(address _address);
}

contract Administrator is Structure{

  University[] allUniversities;
  uint universityCount = 0;

  ContractsInterface universityContract;
  ContractsInterface studentContract;
  ContractsInterface subjectContract;

  function getUniversity() view public {

  }

  function SetSubjectContract(address _address) {
    subjectContract = ContractsInterface(_address);
  }
  function SetStudentContract(address _address) {
    studentContract = ContractsInterface(_address);
  }
  function SetUniversityContract(address _address) {
    universityContract = ContractsInterface(_address);
  }
  function SetAdministrator(){
    universityContract.SetAdministrator(this);
    studentContract.SetAdministrator(this);
    subjectContract.SetAdministrator(this);
  }

  function CreateUniversity(address _owner, string _name) external {
  	allUniversities[universityCount] = University(_owner, universityCount,  Subject[], 0, _name, 0);
  	universityCount++;
  }
}

contract UniversityContract is Structure {

  Administrator admin;
  function SetAdministrator(address _address){
    admin = Administrator(_address);
  }
}

contract StudentContract is Structure{

  Administrator admin;
  function SetAdministrator(address _address){
    admin = Administrator(_address);
  }

	/*
		Creates a new student and adds it to the university array of students
	*/
	function CreateNewStudent(address _address, string _name, uint _universityId) external {
		require(admin.allUniversities[_universityId] != 0);
		require(msg.sender == admin.allUniversities[_universityId].owner);

		admin.allUniversities[_universityId].students.push(Student(_address, _name, admin.allUniversities[_universityId], new SubjectData[], new SubjectData[]));
	}
	/*
		Creates a new subjectData and adds it to the student
	*/
	function CreateNewSubjectData(address _studentAddress, uint _subjectId, uint _universityId) external {
		require(admin.allUniversities[_universityId] != 0);
		require(msg.sender == admin.allUniversities[_universityId].owner);
		require(admin.allUniversities[_universityId].walletToStudent[_studentAddress] != 0);

		University auxUniversity = admin.allUniversities[_universityId];
		Subject auxSubject = auxUniversity.subjects[_subjectId];
		auxUniversity.walletToStudent[_studentAddress].currentSubjects.push(SubjectData(auxSubject.name, auxUniversity, 0));
	}
}

contract SubjectContract is Structure{

}
