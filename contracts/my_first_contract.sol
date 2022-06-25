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
    Person[] public people;
    uint256 public peopleMapCount;
    uint256 public peopleArrayCount;
    
    mapping(uint => Person) public peopleMap;

    address owner; // network account, or wallet.
    modifier onlyOwner() {
        // require is like an assert
        require(msg.sender == owner); // msg is global keyword for metadata
        _;
    }

    // epoch time
    uint256 openingTime = 165618800;
    // conrolling the function with time constraint 
    modifier onlyWhileOpen() {
        require(block.timestamp >= openingTime);
        _;
    }

    struct Person {
        string _firstName;
        string _lastName;
    }

    constructor() {
        owner = msg.sender; // This is the account that deploys the smart contract.
        state = State.Waiting;
    }

    function addPersonToArray(
        string memory _firstName, 
        string memory _lastName
    ) 
        public
        onlyOwner() 
        onlyWhileOpen()
    {
        people.push(Person(_firstName, _lastName));
        incrementPeopleArrayCount();
    }

    function addPersonToMapping(
        string memory _firstName, 
        string memory _lastName
    ) 
        public
        onlyOwner()
        onlyWhileOpen()
    {
        incrementPeopleMapCount();    
        people[peopleMapCount] = Person(_firstName, _lastName);
    }

    function incrementPeopleMapCount() internal {
        peopleMapCount += 1;
    }

    function incrementPeopleArrayCount() internal {
        peopleArrayCount += 1;
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