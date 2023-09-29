// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleCalculator {

  int public value1;
  int public value2;

  function setValue1(int _value1) public {
    value1 = _value1;
  }

  function setValue2(int _value2) public {
    value2 = _value2;    
  }

  function getValue1() public view returns (int) {
    return value1;
  }

  function getValue2() public view returns (int) {
    return value2;
  }

  function add() public view returns (int) {
    return value1 + value2;
  }

  function subtract() public view returns (int) {
    return value1 - value2;
  }

  function multiply() public view returns (int) {
    return value1 * value2;
  }

  function divide() public view returns (int) {
    require(value2 != 0, "Cannot divide by 0");
    return value1 / value2;
  }
}