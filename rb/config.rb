# HtmlToPdfConverter SDK configuration

module HtmlToPdfConverterConfig
  def self.make_config
    {
      "main" => {
        "name" => "HtmlToPdfConverter",
      },
      "feature" => {
        "test" => {
          "options" => {
            "active" => false,
          },
        },
      },
      "options" => {
        "base" => "https://html2pdf.fly.dev/api",
        "headers" => {
          "content-type" => "application/json",
        },
        "entity" => {
          "pdf_generation" => {},
        },
      },
      "entity" => {
        "pdf_generation" => {
          "fields" => [
            {
              "name" => "html",
              "req" => true,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 0,
            },
          ],
          "name" => "pdf_generation",
          "op" => {
            "create" => {
              "name" => "create",
              "points" => [
                {
                  "method" => "POST",
                  "orig" => "/generate",
                  "parts" => [
                    "generate",
                  ],
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "active" => true,
                  "args" => {},
                  "select" => {},
                  "index$" => 0,
                },
              ],
              "input" => "data",
              "key$" => "create",
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
      },
    }
  end


  def self.make_feature(name)
    require_relative 'features'
    HtmlToPdfConverterFeatures.make_feature(name)
  end
end
