# HtmlToPdfConverter SDK configuration

module HtmlToPdfConverterConfig
  # Return the process-wide config, built once on first use. The SDK reads
  # the config on every request and never writes to it, so one instance is
  # shared by every client rather than rebuilt per client.
  #
  # The returned hash is shared: treat it as read-only. Callers that need to
  # mutate should use make_config, which always returns a fresh copy.
  def self.shared_config
    @shared_config ||= make_config
  end


  # Build a fresh, fully materialised config hash. Every call rebuilds the
  # whole structure, so prefer shared_config unless you need a private copy
  # you intend to mutate.
  def self.make_config
    {
      "main" => {
        "name" => "HtmlToPdfConverter",
        "slug" => "html-to-pdf-converter",
        "version" => "0.0.1",
        "target" => "rb",
      },
      "feature" => {
        "test" => {
          "options" => {
            "active" => false,
          },
          "transport" => "base",
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
              "short" => "HTML source code to convert to PDF",
              "type" => "`$STRING`",
            },
          ],
          "name" => "pdf_generation",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "args" => {},
                  "kind" => "http",
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
                },
              ],
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
