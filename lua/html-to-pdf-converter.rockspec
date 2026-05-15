package = "voxgig-sdk-html-to-pdf-converter"
version = "0.0-1"
source = {
  url = "git://github.com/voxgig-sdk/html-to-pdf-converter-sdk.git"
}
description = {
  summary = "HtmlToPdfConverter SDK for Lua",
  license = "MIT"
}
dependencies = {
  "lua >= 5.3",
  "dkjson >= 2.5",
  "dkjson >= 2.5",
}
build = {
  type = "builtin",
  modules = {
    ["html-to-pdf-converter_sdk"] = "html-to-pdf-converter_sdk.lua",
    ["config"] = "config.lua",
    ["features"] = "features.lua",
  }
}
