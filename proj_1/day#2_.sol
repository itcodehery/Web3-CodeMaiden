// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "contracts/testing.sol";

// Paste this and day#1 thing into Remix IDE
 
contract Bank is Owner {
    // State Variables
    address public owner;
    uint256 public interestRate;
    mapping(address => uint) public balances;
    uint256 private timeDeposited;

    function setInterestRate(uint256 newRate) public isOwner {
        require(msg.sender == owner, "Sender is not the owner of the bank!");
        interestRate = newRate;
    }

    function deposit(uint amount) public {
        require(msg.sender != owner, "Owner doesn't have an account in the bank!");
        depositTimestamp = block.timestamp;
        timeDeposited = 
        
    }

    function calculateInterest(uint principle, )


}