-- HtmlToPdfConverter SDK error

local json = require("dkjson")

local HtmlToPdfConverterError = {}
HtmlToPdfConverterError.__index = HtmlToPdfConverterError

-- Reachable for a debugger, absent from the table itself: the context holds
-- the live spec and options, and an error is what gets dumped or encoded.
local CONTEXT = setmetatable({}, { __mode = "k" })


function HtmlToPdfConverterError.new(code, msg, ctx)
  local self = setmetatable({}, HtmlToPdfConverterError)
  self.is_sdk_error = true
  self.sdk = "HtmlToPdfConverter"
  self.code = code or ""
  self.msg = msg or ""
  self.result = nil
  self.spec = nil
  self.status = -1
  CONTEXT[self] = ctx
  return self
end


function HtmlToPdfConverterError:context()
  return CONTEXT[self]
end


function HtmlToPdfConverterError:error()
  return self.msg
end


function HtmlToPdfConverterError:not_found()
  return 404 == self.status
end


-- What make_error attached is already cleaned; the context is not part of
-- the record.
function HtmlToPdfConverterError:to_table()
  return {
    sdk = self.sdk,
    code = self.code,
    msg = self.msg,
    status = self.status,
    result = self.result,
    spec = self.spec,
  }
end


function HtmlToPdfConverterError:to_json()
  return json.encode(self:to_table())
end


function HtmlToPdfConverterError:__tostring()
  return self.msg
end


function HtmlToPdfConverterError.__tojson(self)
  return self:to_json()
end


return HtmlToPdfConverterError
