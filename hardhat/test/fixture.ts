import { Token__factory } from 'build/types'
import { Wallet } from 'ethers'

export async function fixture([wallet]: Wallet[]) {
  const token = await new Token__factory(wallet).deploy('Token', 'T')
  return { token }
}
