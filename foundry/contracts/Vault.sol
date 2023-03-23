// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Vault is ERC20 {
    address public owner;
    ERC20 public token;

    event Deposited(address indexed from, uint256 amount);

    constructor(string memory name, string memory symbol, ERC20 _token) ERC20(name, symbol) {
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

    // fuzzing setup
    function withdraw(uint256 amount) public {
        _burn(msg.sender, amount);
        // if (amount == 10) {
        //     token.transfer(msg.sender, 1);
        //     return;
        // }
        token.transfer(msg.sender, amount);
    }
}
