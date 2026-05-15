-- HtmlToPdfConverter SDK error

local HtmlToPdfConverterError = {}
HtmlToPdfConverterError.__index = HtmlToPdfConverterError


function HtmlToPdfConverterError.new(code, msg, ctx)
  local self = setmetatable({}, HtmlToPdfConverterError)
  self.is_sdk_error = true
  self.sdk = "HtmlToPdfConverter"
  self.code = code or ""
  self.msg = msg or ""
  self.ctx = ctx
  self.result = nil
  self.spec = nil
  return self
end


function HtmlToPdfConverterError:error()
  return self.msg
end


function HtmlToPdfConverterError:__tostring()
  return self.msg
end


return HtmlToPdfConverterError
