# HtmlToPdfConverter SDK utility: feature_add
module HtmlToPdfConverterUtilities
  FeatureAdd = ->(ctx, f) {
    ctx.client.features << f
  }
end
