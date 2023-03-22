// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import { Token } from "../contracts/Token.sol";

contract Fixture {
    address public constant wallet = 0xb4c79daB8f259C7Aee6E5b2Aa729821864227e84;
    Token public token;

    function setupFixture() public {
        token = new Token('Token', 'T');
    }
}
