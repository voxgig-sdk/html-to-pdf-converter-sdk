-- ProjectName SDK exists test

local sdk = require("html-to-pdf-converter_sdk")

describe("HtmlToPdfConverterSDK", function()
  it("should create test SDK", function()
    local testsdk = sdk.test(nil, nil)
    assert.is_not_nil(testsdk)
  end)
end)
