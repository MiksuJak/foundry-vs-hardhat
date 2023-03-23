import { expect, use } from 'chai'
import { describe, it } from 'mocha'
import { solidity } from 'ethereum-waffle'
import { setupFixtureLoader } from 'test/setup'
import { fixture } from './fixture'

use(solidity)

describe('Vault', () => {
  const loadFixture = setupFixtureLoader()

  it('initializes', async () => {
    const { vault, token, wallet } = await loadFixture(fixture)

    expect(await vault.name()).to.eq('Vault')
    expect(await vault.symbol()).to.eq('V')
    expect(await vault.token()).to.eq(token.address)
    expect(await vault.owner()).to.eq(wallet.address)
  })

  describe('deposit', () => {
    it('transfers assets', async () => {
      const { vault, token } = await loadFixture(fixture)

      await token.approve(vault.address, 100)
      await vault.deposit(100)

      expect(await token.balanceOf(vault.address)).to.eq(100)
    })

    it('mints shares', async () => {
      const { vault, token, wallet } = await loadFixture(fixture)

      await token.approve(vault.address, 100)
      await vault.deposit(100)

      expect(await vault.balanceOf(wallet.address)).to.eq(100)
    })

    it('emits event', async () => {
      const { vault, token, wallet } = await loadFixture(fixture)

      await token.approve(vault.address, 100)

      await expect(vault.deposit(100))
        .to.emit(vault, 'Deposited')
        .withArgs(wallet.address, 100)
    })
  })

  describe('manage', () => {
    it('only owner', async () => {
      const { vault, token, other } = await loadFixture(fixture)

      await token.approve(vault.address, 100)
      await vault.deposit(100)

      await expect(vault.connect(other).manage(other.address, 100))
        .to.be.revertedWith('only owner')
    })

    it('transfers assets', async () => {
      const { vault, token, wallet } = await loadFixture(fixture)

      await token.approve(vault.address, 100)
      await vault.deposit(100)
      await vault.manage(wallet.address, 100)

      expect(await token.balanceOf(wallet.address)).to.eq(100)
    })
  })
})