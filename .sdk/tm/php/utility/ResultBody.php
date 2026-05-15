<?php
declare(strict_types=1);

// HtmlToPdfConverter SDK utility: result_body

class HtmlToPdfConverterResultBody
{
    public static function call(HtmlToPdfConverterContext $ctx): ?HtmlToPdfConverterResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result && $response && $response->json_func && $response->body) {
            $result->body = ($response->json_func)();
        }
        return $result;
    }
}
