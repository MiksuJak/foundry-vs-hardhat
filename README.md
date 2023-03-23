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
```bash
forge build
forge test
forge script
```
# 👩🏻‍💼 Package management

## Foundry

```bash
# Initialize new package
forge init uranium --no-commit

# Install openzeppelin-contracts
forge install OpenZeppelin/openzeppelin-contracts --no-commit --root uranium

# Install openzeppelin-contracts-upgradeable
forge install OpenZeppelin/openzeppelin-contracts-upgradeable --no-commit --root uranium
```

## Add local package as a new submodule

```bash
# Add carbon contracts submodule
git submodule add git@github.com:trusttoken/contracts-carbon.git uranium/lib/contracts-carbon
```

## Update submodule

```bash
# Go to
cd lib/contracts-carbon

# Update local git repository
git fetch
git pull

# Go back to the root git repository
cd ..

# Commit updated submodule
git add .
git commit -m "Update carbon contracts"
git push origin/master
```