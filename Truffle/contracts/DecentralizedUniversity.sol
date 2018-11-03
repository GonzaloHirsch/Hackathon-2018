contract DecentralizedUniversity {
  function theTest(address _address) public returns(string){
    return University(_address).test();
  }

}

contract University {

  function test() pure public returns(string) {
    return "IT MOTHER FUCKING WORKED";
  }

}

contract AdministratorContract is Ownable {

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

  function CreateUniversity(address _owner, string _name) external {
  	allUniversities[universityCount] = University(_owner, universityCount, new Subject[], 0, _name, new mapping (address => Student));
  	universityCount++;
  }
}
