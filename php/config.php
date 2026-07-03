<?php
declare(strict_types=1);

// HtmlToPdfConverter SDK configuration

class HtmlToPdfConverterConfig
{
    public static function make_config(): array
    {
        return [
            "main" => [
                "name" => "HtmlToPdfConverter",
            ],
            "feature" => [
                "test" => [
          'options' => [
            'active' => false,
          ],
        ],
            ],
            "options" => [
                "base" => "https://html2pdf.fly.dev/api",
                "auth" => [
                    "prefix" => "Bearer",
                ],
                "headers" => [
          'content-type' => 'application/json',
        ],
                "entity" => [
                    "pdf_generation" => [],
                ],
            ],
            "entity" => [
        'pdf_generation' => [
          'fields' => [
            [
              'active' => true,
              'name' => 'html',
              'req' => true,
              'type' => '`$STRING`',
              'index$' => 0,
            ],
          ],
          'name' => 'pdf_generation',
          'op' => [
            'create' => [
              'input' => 'data',
              'name' => 'create',
              'points' => [
                [
                  'active' => true,
                  'args' => [],
                  'method' => 'POST',
                  'orig' => '/generate',
                  'parts' => [
                    'generate',
                  ],
                  'select' => [],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                  'index$' => 0,
                ],
              ],
              'key$' => 'create',
            ],
          ],
          'relations' => [
            'ancestors' => [],
          ],
        ],
      ],
        ];
    }


    public static function make_feature(string $name)
    {
        require_once __DIR__ . '/features.php';
        return HtmlToPdfConverterFeatures::make_feature($name);
    }
}
