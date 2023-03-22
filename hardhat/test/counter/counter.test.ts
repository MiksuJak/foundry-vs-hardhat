import { expect, use } from 'chai'
import { describe, it } from 'mocha'
import { solidity } from 'ethereum-waffle'
import { counterFixture } from 'fixtures/counterFixture'
import { setupFixtureLoader } from 'test/setup'

use(solidity)

describe('Counter', () => {
  const loadFixture = setupFixtureLoader()

  it('initial value', async () => {
    const { counter } = await loadFixture(counterFixture)
    expect(await counter.number()).to.eq(0)
  })

  it('increment', async () => {
    const { counter } = await loadFixture(counterFixture)
    await counter.increment()
    expect(await counter.number()).to.eq(1)
  })

  ;[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((x) =>
    it(`setNumber ${x}`, async () => {
      const { counter } = await loadFixture(counterFixture)
      await counter.setNumber(x)
      expect(await counter.number()).to.eq(x)
    })
  )
})