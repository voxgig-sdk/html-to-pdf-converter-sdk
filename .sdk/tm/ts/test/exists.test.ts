
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { HtmlToPdfConverterSDK } from '..'


describe('exists', async () => {

  test('test-mode', () => {
    const testsdk = HtmlToPdfConverterSDK.test()
    equal(testsdk instanceof HtmlToPdfConverterSDK, true,
      'HtmlToPdfConverterSDK.test() must return a client synchronously')
  })

})
