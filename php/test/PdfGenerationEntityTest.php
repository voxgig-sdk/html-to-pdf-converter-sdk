<?php
declare(strict_types=1);

// PdfGeneration entity test

require_once __DIR__ . '/../htmltopdfconverter_sdk.php';
require_once __DIR__ . '/Runner.php';

use PHPUnit\Framework\TestCase;
use Voxgig\Struct\Struct as Vs;

class PdfGenerationEntityTest extends TestCase
{
    public function test_create_instance(): void
    {
        $testsdk = HtmlToPdfConverterSDK::test(null, null);
        $ent = $testsdk->PdfGeneration(null);
        $this->assertNotNull($ent);
    }

    public function test_basic_flow(): void
    {
        $setup = pdf_generation_basic_setup(null);
        // Per-op sdk-test-control.json skip.
        $_live = !empty($setup["live"]);
        foreach (["create"] as $_op) {
            [$_shouldSkip, $_reason] = Runner::is_control_skipped("entityOp", "pdf_generation." . $_op, $_live ? "live" : "unit");
            if ($_shouldSkip) {
                $this->markTestSkipped($_reason ?? "skipped via sdk-test-control.json");
                return;
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live mode
        // without an *_ENTID env override, those IDs hit the live API and 4xx.
        if (!empty($setup["synthetic_only"])) {
            $this->markTestSkipped("live entity test uses synthetic IDs from fixture — set HTMLTOPDFCONVERTER_TEST_PDF_GENERATION_ENTID JSON to run live");
            return;
        }
        $client = $setup["client"];

        // CREATE
        $pdf_generation_ref01_ent = $client->PdfGeneration(null);
        $pdf_generation_ref01_data = Helpers::to_map(Vs::getprop(
            Vs::getpath($setup["data"], "new.pdf_generation"), "pdf_generation_ref01"));

        $pdf_generation_ref01_data_result = $pdf_generation_ref01_ent->create($pdf_generation_ref01_data, null);
        $pdf_generation_ref01_data = Helpers::to_map($pdf_generation_ref01_data_result);
        $this->assertNotNull($pdf_generation_ref01_data);

    }
}

function pdf_generation_basic_setup($extra)
{
    Runner::load_env_local();

    $entity_data_file = __DIR__ . '/../../.sdk/test/entity/pdf_generation/PdfGenerationTestData.json';
    $entity_data_source = file_get_contents($entity_data_file);
    $entity_data = json_decode($entity_data_source, true);

    $options = [];
    $options["entity"] = $entity_data["existing"];

    $client = HtmlToPdfConverterSDK::test($options, $extra);

    // Generate idmap.
    $idmap = [];
    foreach (["pdf_generation01", "pdf_generation02", "pdf_generation03"] as $k) {
        $idmap[$k] = strtoupper($k);
    }

    // Detect ENTID env override before envOverride consumes it. When live
    // mode is on without a real override, the basic test runs against synthetic
    // IDs from the fixture and 4xx's. Surface this so the test can skip.
    $entid_env_raw = getenv("HTMLTOPDFCONVERTER_TEST_PDF_GENERATION_ENTID");
    $idmap_overridden = $entid_env_raw !== false && str_starts_with(trim($entid_env_raw), "{");

    $env = Runner::env_override([
        "HTMLTOPDFCONVERTER_TEST_PDF_GENERATION_ENTID" => $idmap,
        "HTMLTOPDFCONVERTER_TEST_LIVE" => "FALSE",
        "HTMLTOPDFCONVERTER_TEST_EXPLAIN" => "FALSE",
    ]);

    $idmap_resolved = Helpers::to_map(
        $env["HTMLTOPDFCONVERTER_TEST_PDF_GENERATION_ENTID"]);
    if ($idmap_resolved === null) {
        $idmap_resolved = Helpers::to_map($idmap);
    }

    if ($env["HTMLTOPDFCONVERTER_TEST_LIVE"] === "TRUE") {
        $merged_opts = Vs::merge([
            [
            ],
            $extra ?? [],
        ]);
        $client = new HtmlToPdfConverterSDK(Helpers::to_map($merged_opts));
    }

    $live = $env["HTMLTOPDFCONVERTER_TEST_LIVE"] === "TRUE";
    return [
        "client" => $client,
        "data" => $entity_data,
        "idmap" => $idmap_resolved,
        "env" => $env,
        "explain" => $env["HTMLTOPDFCONVERTER_TEST_EXPLAIN"] === "TRUE",
        "live" => $live,
        "synthetic_only" => $live && !$idmap_overridden,
        "now" => (int)(microtime(true) * 1000),
    ];
}
