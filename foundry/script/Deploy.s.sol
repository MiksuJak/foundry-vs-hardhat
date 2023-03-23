// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import {Token} from "../contracts/Token.sol";
import {Vault} from "../contracts/Vault.sol";

// source .env
// forge script script/Deploy.s.sol --rpc-url "https://opt-goerli.g.alchemy.com/v2/${ALCHEMY_API_KEY}" --broadcast --verify

contract DeployScript is Script {
    function setUp() public {}

    function run() public {
        uint256 privateKey = vm.envUint("DEPLOYER_PRIVATE_KEY");
        // use privateKey to sign all of the subsequent transactions, with the exclusion of cheatcodes
        vm.startBroadcast(privateKey);

        Token token = new Token('Token', 'T');
        new Vault('Vault', 'V', token);

        vm.stopBroadcast();
    }
}
