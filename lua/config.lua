-- ProjectName SDK configuration

local function make_config()
  return {
    main = {
      name = "HtmlToPdfConverter",
    },
    feature = {
      ["test"] = {
        ["options"] = {
          ["active"] = false,
        },
      },
    },
    options = {
      base = "https://html2pdf.fly.dev/api",
      auth = {
        prefix = "Bearer",
      },
      headers = {
        ["content-type"] = "application/json",
      },
      entity = {
        ["pdf_generation"] = {},
      },
    },
    entity = {
      ["pdf_generation"] = {
        ["fields"] = {
          {
            ["active"] = true,
            ["name"] = "html",
            ["req"] = true,
            ["type"] = "`$STRING`",
            ["index$"] = 0,
          },
        },
        ["name"] = "pdf_generation",
        ["op"] = {
          ["create"] = {
            ["input"] = "data",
            ["name"] = "create",
            ["points"] = {
              {
                ["active"] = true,
                ["args"] = {},
                ["method"] = "POST",
                ["orig"] = "/generate",
                ["parts"] = {
                  "generate",
                },
                ["select"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["index$"] = 0,
              },
            },
            ["key$"] = "create",
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
    },
  }
end


local function make_feature(name)
  local features = require("features")
  local factory = features[name]
  if factory ~= nil then
    return factory()
  end
  return features.base()
end


-- Attach make_feature to the SDK class
local function setup_sdk(SDK)
  SDK._make_feature = make_feature
end


return make_config
