# HtmlToPdfConverter SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/test_feature'


module HtmlToPdfConverterFeatures
  def self.make_feature(name)
    case name
    when "base"
      HtmlToPdfConverterBaseFeature.new
    when "test"
      HtmlToPdfConverterTestFeature.new
    else
      HtmlToPdfConverterBaseFeature.new
    end
  end
end
