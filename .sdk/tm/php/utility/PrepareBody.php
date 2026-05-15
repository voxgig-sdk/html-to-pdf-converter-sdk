<?php
declare(strict_types=1);

// HtmlToPdfConverter SDK utility: prepare_body

class HtmlToPdfConverterPrepareBody
{
    public static function call(HtmlToPdfConverterContext $ctx): mixed
    {
        if ($ctx->op->input === 'data') {
            return ($ctx->utility->transform_request)($ctx);
        }
        return null;
    }
}
