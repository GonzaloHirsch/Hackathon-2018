contract SubjectContract {

  Administrator admin;
  function SetAdministrator(address _address){
    admin = Administrator(_address);
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

contract StudentContract {

  Administrator admin;
  function SetAdministrator(address _address){
    admin = Administrator(_address);
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
	/*
		Creates a new student and adds it to the university array of students
	*/
	function CreateNewStudent(address _address, string _name, uint _universityId) external {
		require(allUniversities[_universityId] != 0);
		require(msg.sender == allUniversities[_universityId].owner);

		allUniversities[_universityId].students.push(Student(_address, _name, allUniversities[_universityId], new SubjectData[], new SubjectData[]));
	}
	/*
		Creates a new subjectData and adds it to the student
	*/
	function CreateNewSubjectData(address _studentAddress, uint _subjectId, uint _universityId) external {
		require(allUniversities[_universityId] != 0);
		require(msg.sender == allUniversities[_universityId].owner);
		require(allUniversities[_universityId].walletToStudent[_studentAddress] != 0);

		University auxUniversity = allUniversities[_universityId];
		Subject auxSubject = auxUniversity.subjects[_subjectId];
		auxUniversity.walletToStudent[_studentAddress].currentSubjects.push(SubjectData(auxSubject.name, auxUniversity, 0));
	}
}

contract UniversityContract {

  Administrator admin;
  function SetAdministrator(address _address){
    admin = Administrator(_address);
  }

}


contract AdministratorContract {

  University[] allUniversities;
  uint universityCount = 0;

  University UniversityContract;
  Student StudentContract;
  Subject SubjectContract;

  function SetSubjectContract(address _address) {
    SubjectContract = Subject(_address);
  }
  function SetStudentContract(address _address) {
    StudentContract = Student(_address);
  }
  function SetUniversityContract(address _address) {
    UniversityContract = University(_address);
  }
  function SetAdministrator(){
    UniversityContract.SetAdministrator(this);
    StudentContract.SetAdministrator(this);
    SubjectContract.SetAdministrator(this);
  }

  function CreateUniversity(address _owner, string _name) external {
  	//allUniversities[universityCount] = University(_owner, universityCount, new Subject[], 0, _name, new mapping (address => Student));
  	//universityCount++;
  }
}
