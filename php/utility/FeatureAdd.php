<?php
declare(strict_types=1);

// HtmlToPdfConverter SDK utility: feature_add

class HtmlToPdfConverterFeatureAdd
{
    public static function call(HtmlToPdfConverterContext $ctx, mixed $f): void
    {
        $ctx->client->features[] = $f;
    }
}
