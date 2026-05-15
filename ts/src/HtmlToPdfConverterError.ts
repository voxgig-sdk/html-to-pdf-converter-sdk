
import { Context } from './Context'


class HtmlToPdfConverterError extends Error {

  isHtmlToPdfConverterError = true

  sdk = 'HtmlToPdfConverter'

  code: string
  ctx: Context

  constructor(code: string, msg: string, ctx: Context) {
    super(msg)
    this.code = code
    this.ctx = ctx
  }

}

export {
  HtmlToPdfConverterError
}

