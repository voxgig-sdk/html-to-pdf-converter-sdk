# HtmlToPdfConverter SDK

Turn raw HTML source into a downloadable PDF with a single HTTP POST, no signup required

> TypeScript, Python, PHP, Golang, Ruby, Lua SDKs, a CLI, an interactive REPL, and an MCP server for AI agents — all generated from one OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).

## About HTML to PDF Converter

[HTML to PDF Converter](https://html2pdf.fly.dev/) is a small hosted utility that turns a chunk of HTML source code into a PDF file. It runs on Fly.io and wraps the open-source [puppeteer-html-to-pdf-converter](https://github.com/ideadapt/puppeteer-html-to-pdf-converter) project, which uses headless Chromium under the hood.

What you get from the API:

- A single `POST /api/generate` endpoint that accepts a JSON body with an `html` field containing the markup to render.
- A binary `application/pdf` response on success, or a JSON error payload on failure.
- No API key, OAuth, or account — requests can be issued straight from a server-side script or job.

Operationally the service is unauthenticated and has no documented rate limits, so it is best suited to low-volume conversions, prototypes, and internal tooling. CORS is disabled on the public endpoint, so calls should be made from a backend rather than directly from a browser.

## Try it

**TypeScript**
```bash
npm install html-to-pdf-converter
```

**Python**
```bash
pip install html-to-pdf-converter-sdk
```

**PHP**
```bash
composer require voxgig/html-to-pdf-converter-sdk
```

**Golang**
```bash
go get github.com/voxgig-sdk/html-to-pdf-converter-sdk/go
```

**Ruby**
```bash
gem install html-to-pdf-converter-sdk
```

**Lua**
```bash
luarocks install html-to-pdf-converter-sdk
```

## 30-second quickstart

### TypeScript

```ts
import { HtmlToPdfConverterSDK } from 'html-to-pdf-converter'

const client = new HtmlToPdfConverterSDK({})

```

See the [TypeScript README](ts/README.md) for the
full guide, or scroll down for the same example in other languages.

## What's in the box

| Surface | Use it for | Path |
| --- | --- | --- |
| **SDK** (TypeScript, Python, PHP, Golang, Ruby, Lua) | App integration | `ts/` `py/` `php/` `go/` `rb/` `lua/` |
| **CLI** | Scripts, CI, ops, one-off API calls | `go-cli/` |
| **MCP server** | AI agents (Claude, Cursor, Cline) | `go-mcp/` |

## Use it from an AI agent (MCP)

The generated MCP server exposes every operation in this SDK as an
[MCP](https://modelcontextprotocol.io) tool that Claude, Cursor or Cline
can call directly. Build and register it:

```bash
cd go-mcp && go build -o html-to-pdf-converter-mcp .
```

Then add it to your agent's MCP config (Claude Desktop, Cursor, etc.):

```json
{
  "mcpServers": {
    "html-to-pdf-converter": {
      "command": "/abs/path/to/html-to-pdf-converter-mcp"
    }
  }
}
```

## Entities

The API exposes one entity:

| Entity | Description | API path |
| --- | --- | --- |
| **PdfGeneration** | Render-on-demand PDFs produced from supplied HTML markup via `POST /api/generate`. | `/generate` |

Each entity supports the following operations where available: **load**,
**list**, **create**, **update**, and **remove**.

## Quickstart in other languages

### Python

```python
from htmltopdfconverter_sdk import HtmlToPdfConverterSDK

client = HtmlToPdfConverterSDK({})

```

### PHP

```php
<?php
require_once 'htmltopdfconverter_sdk.php';

$client = new HtmlToPdfConverterSDK([]);

```

### Golang

```go
import sdk "github.com/voxgig-sdk/html-to-pdf-converter-sdk/go"

client := sdk.NewHtmlToPdfConverterSDK(map[string]any{})

```

### Ruby

```ruby
require_relative "HtmlToPdfConverter_sdk"

client = HtmlToPdfConverterSDK.new({})

```

### Lua

```lua
local sdk = require("html-to-pdf-converter_sdk")

local client = sdk.new({})

```

## Unit testing in offline mode

Every SDK ships a test mode that swaps the HTTP transport for an
in-memory mock, so unit tests run offline.

### TypeScript

```ts
const client = HtmlToPdfConverterSDK.test()
const result = await client.PdfGeneration().load({ id: 'test01' })
// result.ok === true, result.data contains mock data
```

### Python

```python
client = HtmlToPdfConverterSDK.test(None, None)
result, err = client.PdfGeneration(None).load(
    {"id": "test01"}, None
)
```

### PHP

```php
$client = HtmlToPdfConverterSDK::test(null, null);
[$result, $err] = $client->PdfGeneration(null)->load(
    ["id" => "test01"], null
);
```

### Golang

```go
client := sdk.TestSDK(nil, nil)
result, err := client.PdfGeneration(nil).Load(
    map[string]any{"id": "test01"}, nil,
)
```

### Ruby

```ruby
client = HtmlToPdfConverterSDK.test(nil, nil)
result, err = client.PdfGeneration(nil).load(
  { "id" => "test01" }, nil
)
```

### Lua

```lua
local client = sdk.test(nil, nil)
local result, err = client:PdfGeneration(nil):load(
  { id = "test01" }, nil
)
```

## How it works

Every SDK call runs the same five-stage pipeline:

1. **Point** — resolve the API endpoint from the operation definition.
2. **Spec** — build the HTTP specification (URL, method, headers, body).
3. **Request** — send the HTTP request.
4. **Response** — receive and parse the response.
5. **Result** — extract the result data for the caller.

A feature hook fires at each stage (e.g. `PrePoint`, `PreSpec`,
`PreRequest`), so features can inspect or modify the pipeline without
forking the SDK.

### Features

| Feature | Purpose |
| --- | --- |
| **TestFeature** | In-memory mock transport for testing without a live server |

Pass custom features via the `extend` option at construction time.

### Direct and Prepare

For endpoints the entity model doesn't cover, use the low-level methods:

- **`direct(fetchargs)`** — build and send an HTTP request in one step.
- **`prepare(fetchargs)`** — build the request without sending it.

Both accept a map with `path`, `method`, `params`, `query`,
`headers`, and `body`. See the [How-to guides](#how-to-guides) below.

## How-to guides

### Make a direct API call

When the entity interface does not cover an endpoint, use `direct`:

**TypeScript:**
```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example' },
})
console.log(result.data)
```

**Python:**
```python
result, err = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example"},
})
```

**PHP:**
```php
[$result, $err] = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example"],
]);
```

**Go:**
```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example"},
})
```

**Ruby:**
```ruby
result, err = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example" },
})
```

**Lua:**
```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example" },
})
```

## Per-language documentation

- [TypeScript](ts/README.md)
- [Python](py/README.md)
- [PHP](php/README.md)
- [Golang](go/README.md)
- [Ruby](rb/README.md)
- [Lua](lua/README.md)

## Using the HTML to PDF Converter

- Upstream: [https://html2pdf.fly.dev/](https://html2pdf.fly.dev/)

- The hosted service is offered free of charge with no authentication or signup.
- No formal terms of service, SLA, or licence text are published on the API page.
- The underlying implementation is the open-source [puppeteer-html-to-pdf-converter](https://github.com/ideadapt/puppeteer-html-to-pdf-converter) project; check its repository for source-level licensing.
- Treat the service as best-effort and confirm acceptable use before relying on it for production traffic.

---

Generated from the HTML to PDF Converter OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).
