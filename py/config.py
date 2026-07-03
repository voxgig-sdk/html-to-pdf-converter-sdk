# HtmlToPdfConverter SDK configuration


def make_config():
    return {
        "main": {
            "name": "HtmlToPdfConverter",
        },
        "feature": {
            "test": {
        "options": {
          "active": False,
        },
      },
        },
        "options": {
            "base": "https://html2pdf.fly.dev/api",
            "auth": {
                "prefix": "Bearer",
            },
            "headers": {
        "content-type": "application/json",
      },
            "entity": {
                "pdf_generation": {},
            },
        },
        "entity": {
      "pdf_generation": {
        "fields": [
          {
            "active": True,
            "name": "html",
            "req": True,
            "type": "`$STRING`",
            "index$": 0,
          },
        ],
        "name": "pdf_generation",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "active": True,
                "args": {},
                "method": "POST",
                "orig": "/generate",
                "parts": [
                  "generate",
                ],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "create",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }
