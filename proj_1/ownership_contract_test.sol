// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "hardhat/console.sol"; // adds console.log() function


contract Owner {
    address private owner;

    event OwnerSet(address indexed oldOwner, address indexed newOwner);

    modifier isOwner() {
        require(msg.sender == owner, "Caller is not owner");
        _;
    }

    constructor()  {
        console.log("Owner contract deployed by:", msg.sender);
        owner = msg.sender;
        emit OwnerSet(msg.sender, owner);
    }

    function setOwner(address newOwner) public isOwner {
        require(newOwner != address(0), "New Owner cannot be zero address");
        emit OwnerSet(msg.sender, owner);
        owner = newOwner;
    }

    function getOwner() external view returns (address) {
        return owner;
    }
}

// To make the contract pausable
contract PausableOwner is Owner {
    bool public isPaused = false;
    
    // TODO: Add function to pause (only owner)
    function pauseContract() public isOwner {
        require(!isPaused, "contract is already paused");
        isPaused = true;
    }
    // TODO: Add function to unpause (only owner)
    function unpauseContract() public isOwner {
        require(isPaused, "Contract is running");
        isPaused = false;
    }  
    // TODO: Add modifier to check if contract is NOT paused
    modifier whenNotPaused() {
        require(!isPaused, "Contract is running");
        _;
    }
    
    function normalFunction() public view whenNotPaused {
        // This should only work when contract is not paused
        console.log("Normal function executed");
    }
}