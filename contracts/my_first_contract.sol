// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.9;

contract MyFirstContract {

    string public value = "Hello World";
    bool public myBool = true;
    int public myInt = 1;
    uint public myUInt = 1;
    uint8 public myUInt8 = 8;
    uint256 public myUInt256 = 99999;

    enum State { Waiting, Ready, Active }

    State public state;

    constructor() {
        state = State.Waiting;
    }

    function activate() public {
        state = State.Active;
    }

    function isActive() public view returns(bool) {
        return state == State.Active;
    }


    function set(string memory _value) public {
        value = _value;
    }

}