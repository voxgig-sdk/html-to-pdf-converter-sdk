<?php
declare(strict_types=1);

// HtmlToPdfConverter SDK utility: result_headers

class HtmlToPdfConverterResultHeaders
{
    public static function call(HtmlToPdfConverterContext $ctx): ?HtmlToPdfConverterResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}
