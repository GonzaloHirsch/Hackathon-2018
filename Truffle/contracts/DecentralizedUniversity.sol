pragma solidity ^0.4.24;

contract Student{

	struct Course{
		string name;
		string university;
	}

	struct FinishedCourse{
		Course endCourse;
		uint grade;
	}

	Course[] courses;
	FinishedCourse[] finishedCourses;

	//EXTRA FUNCTIONS

	function ResetCourses() external{
		for (uint i = 0; i<=courses.length-1; i++){
            delete courses[i];
            courses.length--;
        }
	}

	function RemoveCourse(uint index) internal {
		require(index < courses.length);

        for (uint i = index; i<courses.length-1; i++){
            courses[i] = courses[i+1];
        }
        delete courses[courses.length-1];
        courses.length--;
    }

	//ADDING COURSES

	function SubscribeToCourse(string _name, string _university) external{
		courses.push(Course(_name, _university));
	}

	function GetCoursesLength() view external returns(uint) {
		return courses.length;
	}

	function GetCourse(uint _index) view external returns(string, string){
		//require(_index < courses.length);
		Course storage aux = courses[_index];
		return (aux.name, aux.university);
	}

	//FINISHING COURSES

	function GetFinishedCoursesLength() view external returns(uint){
		return finishedCourses.length;
	}

	function GetFinishedCourse(uint _index) view external returns(string, string, uint){
		FinishedCourse storage aux = finishedCourses[_index];
		Course storage auxCourse = aux.endCourse;
		return (auxCourse.name, auxCourse.university, aux.grade);
	}

	function FinishCourse(uint _index, uint _grade) external{
		Course storage aux = courses[_index];
		RemoveCourse(_index);
		finishedCourses.push(FinishedCourse(aux, _grade));
	}
}