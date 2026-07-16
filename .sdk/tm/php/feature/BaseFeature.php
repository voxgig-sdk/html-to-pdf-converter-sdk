<?php
declare(strict_types=1);

// HtmlToPdfConverter SDK base feature

class HtmlToPdfConverterBaseFeature
{
    public string $version;
    public string $name;
    public bool $active;

    // Positions this feature when added via the client `extend` option:
    // "__before__" / "__after__" / "__replace__" name an already-added
    // feature (mirrors the ts feature `_options`). Declared so setting it
    // on an extension instance avoids the dynamic-property deprecation.
    public ?array $_options = null;

    public function __construct()
    {
        $this->version = '0.0.1';
        $this->name = 'base';
        $this->active = true;
    }

    public function get_version(): string { return $this->version; }
    public function get_name(): string { return $this->name; }
    public function get_active(): bool { return $this->active; }

    public function init(HtmlToPdfConverterContext $ctx, array $options): void {}
    public function PostConstruct(HtmlToPdfConverterContext $ctx): void {}
    public function PostConstructEntity(HtmlToPdfConverterContext $ctx): void {}
    public function SetData(HtmlToPdfConverterContext $ctx): void {}
    public function GetData(HtmlToPdfConverterContext $ctx): void {}
    public function GetMatch(HtmlToPdfConverterContext $ctx): void {}
    public function SetMatch(HtmlToPdfConverterContext $ctx): void {}
    public function PrePoint(HtmlToPdfConverterContext $ctx): void {}
    public function PreSpec(HtmlToPdfConverterContext $ctx): void {}
    public function PreRequest(HtmlToPdfConverterContext $ctx): void {}
    public function PreResponse(HtmlToPdfConverterContext $ctx): void {}
    public function PreResult(HtmlToPdfConverterContext $ctx): void {}
    public function PreDone(HtmlToPdfConverterContext $ctx): void {}
    public function PreUnexpected(HtmlToPdfConverterContext $ctx): void {}
}
