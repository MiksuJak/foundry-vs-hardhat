import { expect, use } from 'chai'
import { describe, it } from 'mocha'
import { solidity } from 'ethereum-waffle'
import { fixture } from 'test/fixture'
import { setupFixtureLoader } from 'test/setup'

use(solidity)

describe('Token', () => {
  const loadFixture = setupFixtureLoader()

  it('initial balance is 0', async () => {
    const { token, wallet } = await loadFixture(fixture)
    expect(await token.balanceOf(wallet.address)).to.eq(0)
  })

  it('mints tokens to user', async () => {
    const { token, wallet } = await loadFixture(fixture)
    await token.mint(wallet.address, 100)
    expect(await token.balanceOf(wallet.address)).to.eq(100)
  })
})