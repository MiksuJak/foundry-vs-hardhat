// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Counter {
    uint256 public number;

    function setNumber(uint256 newNumber) public {
        if (newNumber == 100) {
            number = 420;
        } else {
            number = newNumber;
        }
    }

    function increment() public {
        number++;
    }
}
