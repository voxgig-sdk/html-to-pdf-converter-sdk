# HtmlToPdfConverter SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/ratelimit_feature'
require_relative 'feature/retry_feature'
require_relative 'feature/test_feature'
require_relative 'feature/timeout_feature'


module HtmlToPdfConverterFeatures
  def self.make_feature(name)
    case name
    when "base"
      HtmlToPdfConverterBaseFeature.new
    when "ratelimit"
      HtmlToPdfConverterRatelimitFeature.new
    when "retry"
      HtmlToPdfConverterRetryFeature.new
    when "test"
      HtmlToPdfConverterTestFeature.new
    when "timeout"
      HtmlToPdfConverterTimeoutFeature.new
    else
      HtmlToPdfConverterBaseFeature.new
    end
  end
end
