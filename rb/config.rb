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
              "active" => true,
              "name" => "html",
              "req" => true,
              "type" => "`$STRING`",
              "index$" => 0,
            },
          ],
          "name" => "pdf_generation",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "active" => true,
                  "args" => {},
                  "method" => "POST",
                  "orig" => "/generate",
                  "parts" => [
                    "generate",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
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
