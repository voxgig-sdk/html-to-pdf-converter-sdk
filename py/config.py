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
            "name": "html",
            "req": True,
            "type": "`$STRING`",
            "active": True,
            "index$": 0,
          },
        ],
        "name": "pdf_generation",
        "op": {
          "create": {
            "name": "create",
            "points": [
              {
                "method": "POST",
                "orig": "/generate",
                "parts": [
                  "generate",
                ],
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "args": {},
                "select": {},
                "index$": 0,
              },
            ],
            "input": "data",
            "key$": "create",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }
