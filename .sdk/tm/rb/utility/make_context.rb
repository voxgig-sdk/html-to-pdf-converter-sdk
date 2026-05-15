# HtmlToPdfConverter SDK utility: make_context
require_relative '../core/context'
module HtmlToPdfConverterUtilities
  MakeContext = ->(ctxmap, basectx) {
    HtmlToPdfConverterContext.new(ctxmap, basectx)
  }
end
