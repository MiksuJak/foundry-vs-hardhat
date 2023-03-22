// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import { Test } from "forge-std/Test.sol";
import { Token } from "../contracts/Token.sol";
import { Fixture } from "./Fixture.sol";

contract TokenTest is Test, Fixture {
    function setUp() public {
        setupFixture();
    }

    function test_initialBalance() public {
        assertEq(token.balanceOf(wallet), 0);
    }

    function test_mintsTokensToUser() public {
        token.mint(wallet, 100);
        assertEq(token.balanceOf(wallet), 100);
    }
}
