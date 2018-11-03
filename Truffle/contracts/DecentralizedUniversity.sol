contract DecentralizedUniversity {

  function testDe(address _address) public {
    University(_address).test();
  }

}

contract University {

  function test() pure public returns(uint) {
    return 1;
  }

}
