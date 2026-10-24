# HtmlToPdfConverter SDK utility: prepare_body
require_relative 'media'
module HtmlToPdfConverterUtilities
  PrepareBody = ->(ctx) {
    return nil unless ctx.op.input == "data"
    return HtmlToPdfConverterUtilities.raw_body(ctx.reqdata) if HtmlToPdfConverterUtilities.raw_request?(ctx.point)
    ctx.utility.transform_request.call(ctx)
  }
end
