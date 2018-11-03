pragma solidity ^0.4.24;

contract Student{

	struct Course{
		string university;
		string name;
	}

	Course[] courses;

	function SubscribeToCourse(string _name, string _university) external{
		courses.push(Course(_name, _university));
	}

	function GetCoursesLength() view external returns(uint) {
		return courses.length;
	}

	function GetElements(uint index) view external returns(string, string){
		Course storage aux = courses[index];
		return (aux.university, aux.name);
	}
}