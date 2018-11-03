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
