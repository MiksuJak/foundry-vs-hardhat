import { Counter__factory } from 'build/types'
import { Wallet } from 'ethers'

export async function counterFixture([wallet]: Wallet[]) {
  const counter = await new Counter__factory(wallet).deploy()
  return { counter }
}
