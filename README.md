# ⚒️ Foundry Overview

## 🔗 Links
[⬇️ Get foundry!](https://github.com/foundry-rs/foundry)
[📖 Read about foundry!](https://book.getfoundry.sh/)

## 🔨 Anvil
Anvil is Foundry's Ganache. It enables you to run a local Ethereum network for testing purposes.

Run:
```anvil```

## 🖨️ Chisel
Chisel is an advanced Solidity REPL(short for "read-eval-print loop")  shipped with Foundry. It can be used to quickly test the behavior of Solidity snippets on a local or forked network.

Run:
```chisel```

## ☎️ Cast
Cast is Foundry's command-line tool for performing Ethereum RPC calls. You can make smart contract calls, send transactions, or retrieve any type of chain data - all from your command-line! And it has hardware wallet support!

Run:
```cast call 0x7c9b8374b32c75f06c5e5a16ace1822c28f3e87e "value()(uint256)" --rpc-url https://ethereum-mainnet-rpc.allthatnode.com```
Check the value of USDC.homes portfolio

## 🌋 Forge

Forge is a tool for building, testing and deploying Ethereum smart contracts.

Run:
```forge build```
```forge test```
```forge deploy```