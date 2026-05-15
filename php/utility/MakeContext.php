<?php
declare(strict_types=1);

// HtmlToPdfConverter SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class HtmlToPdfConverterMakeContext
{
    public static function call(array $ctxmap, ?HtmlToPdfConverterContext $basectx): HtmlToPdfConverterContext
    {
        return new HtmlToPdfConverterContext($ctxmap, $basectx);
    }
}
