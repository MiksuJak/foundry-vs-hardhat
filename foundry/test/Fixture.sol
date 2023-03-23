// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import { Token } from "../contracts/Token.sol";
import { Vault } from "../contracts/Vault.sol";

contract Fixture {
    address public constant wallet = 0x7FA9385bE102ac3EAc297483Dd6233D62b3e1496;
    address public constant other = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;
    address public constant another = 0x70997970C51812dc3A010C7d01b50e0d17dc79C8;
    
    Token public token;
    Vault public vault;

    function setupContracts() public {
        token = new Token('Token', 'T');
        vault = new Vault('Vault', 'V', token);
        token.mint(wallet, 100);
    }
}
