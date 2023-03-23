// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Token} from "./Token.sol";

contract Vault is ERC20 {
    address public owner;
    Token public token;

    event Deposited(address indexed from, uint256 amount);

    constructor(string memory name, string memory symbol, Token _token) ERC20(name, symbol) {
        owner = msg.sender;
        token = _token;
    }

    function deposit(uint256 amount) external {
        _mint(msg.sender, amount);
        token.transferFrom(msg.sender, address(this), amount);
        emit Deposited(msg.sender, amount);
    }

    function manage(address to, uint256 amount) external {
        require(msg.sender == owner, "only owner");
        token.transfer(to, amount);
    }
}
