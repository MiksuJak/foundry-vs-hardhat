// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import { Test } from "forge-std/Test.sol";
import { Fixture } from "./Fixture.sol";
import { IMockContract } from "../contracts/IMockContract.sol";

contract VaultTest is Test, Fixture {
    event Deposited(address indexed from, uint256 amount);

    function setUp() public {
        setupContracts();
    }

    function test_initializes() public {
        // require interrupts the test once failed, assertEq continues
        // require(vault.name() == 'Vault');
        assertEq(vault.name(), 'Vault');
        assertEq(vault.symbol(), 'V');
        assertEq(address(vault.token()), address(token));
        assertEq(vault.owner(), wallet);
    }

    function test_deposit_transfersAssets() public {
        token.approve(address(vault), 100);
        vault.deposit(100);

        assertEq(token.balanceOf(address(vault)), 100);
    }

    function test_deposit_mintsShares () public {
        token.approve(address(vault), 100);
        vault.deposit(100);

        assertEq(vault.balanceOf(wallet), 100);
    }

    function test_deposit_emitsEvent () public {
        token.approve(address(vault), 100);

        // Events can have up to 3 indexed attributes. The first three booleans tell us which of them we want to check. The last one is for non-indexed attributes.
        vm.expectEmit(true, false, false, true);
        emit Deposited(wallet, 100);
        vault.deposit(100);
    }

    function test_manage_revertWhen_callerIsNotTheOwner () public {
        token.approve(address(vault), 100);
        vault.deposit(100);

        vm.prank(other);
        vm.expectRevert('only owner');
        vault.manage(other, 100);
    }

    function test_manage_transfersAssets () public {
        token.approve(address(vault), 100);
        vault.deposit(100);

        vault.manage(other, 100);

        assertEq(token.balanceOf(other), 100);
    }

    // Other useful cheatcodes
    // We can also run `forge test --watch`

    // using other accounts
    // function test_deposit_asOther_1 () public {
    //     token.mint(other, 100);

    //     vm.prank(other);
    //     token.approve(address(vault), 100);
    //     vm.prank(other);
    //     vault.deposit(100);

    //     assertEq(vault.balanceOf(other), 100);
    // }

    // function test_deposit_asOther_2 () public {
    //     token.mint(other, 100);

    //     vm.startPrank(other);
    //     token.approve(address(vault), 100);
    //     vault.deposit(100);
    //     assertEq(vault.balanceOf(other), 100);
        
    //     vm.stopPrank();

    //     token.approve(address(vault), 50);
    //     vault.deposit(50);
    //     assertEq(vault.balanceOf(wallet), 50);
    // }

    // time traveling
    // function test_timeTravel () public {
    //     vm.warp(2137);
    //     assertEq(block.timestamp, 2137);
    // }

    // set ether balance
    // function test_increaseEtherBalance () public {
    //     vm.deal(wallet, 420);
    //     assertEq(wallet.balance, 420);
    // }

    // mocks
    // function test_mock () public {
    //     IMockContract mockContract = IMockContract(address(69));
    //     vm.mockCall(
    //         address(mockContract),
    //         abi.encodeWithSelector(IMockContract.foo.selector),
    //         abi.encode('bar')
    //     );

    //     assertEq(mockContract.foo(), 'bar');
    // }

    // called on contract
    // function test_calledOnContract () public {
    //     token.approve(address(vault), 100);
    //     vm.expectCall(address(token), abi.encodeWithSelector(token.transferFrom.selector, wallet, address(vault), 100));
    //     vault.deposit(100);
    // }

    // fuzzing
    
    // we can increase number of runs by FOUNDRY_FUZZ_RUNS env_variable
    // function test_withdraw(uint256 x) public {
    //     // vm.assume(x <= 100);
    //     // vm.assume(x != 10);

    //     token.approve(address(vault), x);
    //     vault.deposit(x);
    //     uint256 balanceBefore = token.balanceOf(wallet);
    //     vault.withdraw(x);

    //     assertEq(token.balanceOf(wallet), balanceBefore + x);
    // }
}
