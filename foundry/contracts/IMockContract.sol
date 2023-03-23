// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface IMockContract {
    function foo() external returns (string memory);

    function balance(address) external returns (uint256);
}
