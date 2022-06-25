// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.9;

contract MyFirstContract {

    string value;

    constructor() {
        value = "HelloWorld";
    }

    function get() public view returns(string memory) {
        return value;
    }

    function set(string memory _value) public {
        value = _value;
    }

}