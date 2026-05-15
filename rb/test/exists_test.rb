# HtmlToPdfConverter SDK exists test

require "minitest/autorun"
require_relative "../HtmlToPdfConverter_sdk"

class ExistsTest < Minitest::Test
  def test_create_test_sdk
    testsdk = HtmlToPdfConverterSDK.test(nil, nil)
    assert !testsdk.nil?
  end
end
