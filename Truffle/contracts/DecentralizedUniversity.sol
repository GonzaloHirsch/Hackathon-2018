contract DecentralizedUniversity {
  function theTest(address _address) public returns(string){
    return University(_address).test();
  }

}

contract Subject {
	struct Subject{
		address owner;
		string name;
		string contents;
		uint SubjectID;
		uint depth;
		University university;
	}
}

contract Student {
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
	function CreateNewStudent(address _address, string _name, uint _universityId) external {
		
	}
}

contract University {

  function test() pure public returns(string) {
    return "IT MOTHER FUCKING WORKED";
  }

}
