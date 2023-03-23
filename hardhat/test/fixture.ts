import { Token__factory, Vault__factory } from 'build/types'
import { Wallet } from 'ethers'

export async function fixture([wallet]: Wallet[]) {
  const token = await new Token__factory(wallet).deploy('Token', 'T')
  const vault = await new Vault__factory(wallet).deploy('Vault', 'V', token.address)
  await token.mint(wallet.address, 100)
  return { token, vault }
}
