package sdktest

import (
	"encoding/json"
	"os"
	"path/filepath"
	"runtime"
	"strings"
	"testing"
	"time"

	sdk "github.com/voxgig-sdk/html-to-pdf-converter-sdk"
	"github.com/voxgig-sdk/html-to-pdf-converter-sdk/core"

	vs "github.com/voxgig/struct"
)

func TestPdfGenerationEntity(t *testing.T) {
	t.Run("instance", func(t *testing.T) {
		testsdk := sdk.TestSDK(nil, nil)
		ent := testsdk.PdfGeneration(nil)
		if ent == nil {
			t.Fatal("expected non-nil PdfGenerationEntity")
		}
	})

	t.Run("basic", func(t *testing.T) {
		setup := pdf_generationBasicSetup(nil)
		// Per-op sdk-test-control.json skip — basic test exercises a flow
		// with multiple ops; skipping any op skips the whole flow.
		_mode := "unit"
		if setup.live {
			_mode = "live"
		}
		for _, _op := range []string{"create"} {
			if _shouldSkip, _reason := isControlSkipped("entityOp", "pdf_generation." + _op, _mode); _shouldSkip {
				if _reason == "" {
					_reason = "skipped via sdk-test-control.json"
				}
				t.Skip(_reason)
				return
			}
		}
		// The basic flow consumes synthetic IDs from the fixture. In live mode
		// without an *_ENTID env override, those IDs hit the live API and 4xx.
		if setup.syntheticOnly {
			t.Skip("live entity test uses synthetic IDs from fixture — set HTMLTOPDFCONVERTER_TEST_PDF_GENERATION_ENTID JSON to run live")
			return
		}
		client := setup.client

		// CREATE
		pdfGenerationRef01Ent := client.PdfGeneration(nil)
		pdfGenerationRef01Data := core.ToMapAny(vs.GetProp(
			vs.GetPath([]any{"new", "pdf_generation"}, setup.data), "pdf_generation_ref01"))

		pdfGenerationRef01DataResult, err := pdfGenerationRef01Ent.Create(pdfGenerationRef01Data, nil)
		if err != nil {
			t.Fatalf("create failed: %v", err)
		}
		pdfGenerationRef01Data = core.ToMapAny(pdfGenerationRef01DataResult)
		if pdfGenerationRef01Data == nil {
			t.Fatal("expected create result to be a map")
		}

	})
}

func pdf_generationBasicSetup(extra map[string]any) *entityTestSetup {
	loadEnvLocal()

	_, filename, _, _ := runtime.Caller(0)
	dir := filepath.Dir(filename)

	entityDataFile := filepath.Join(dir, "..", "..", ".sdk", "test", "entity", "pdf_generation", "PdfGenerationTestData.json")

	entityDataSource, err := os.ReadFile(entityDataFile)
	if err != nil {
		panic("failed to read pdf_generation test data: " + err.Error())
	}

	var entityData map[string]any
	if err := json.Unmarshal(entityDataSource, &entityData); err != nil {
		panic("failed to parse pdf_generation test data: " + err.Error())
	}

	options := map[string]any{}
	options["entity"] = entityData["existing"]

	client := sdk.TestSDK(options, extra)

	// Generate idmap via transform, matching TS pattern.
	idmap := vs.Transform(
		[]any{"pdf_generation01", "pdf_generation02", "pdf_generation03"},
		map[string]any{
			"`$PACK`": []any{"", map[string]any{
				"`$KEY`": "`$COPY`",
				"`$VAL`": []any{"`$FORMAT`", "upper", "`$COPY`"},
			}},
		},
	)

	// Detect ENTID env override before envOverride consumes it. When live
	// mode is on without a real override, the basic test runs against synthetic
	// IDs from the fixture and 4xx's. Surface this so the test can skip.
	entidEnvRaw := os.Getenv("HTMLTOPDFCONVERTER_TEST_PDF_GENERATION_ENTID")
	idmapOverridden := entidEnvRaw != "" && strings.HasPrefix(strings.TrimSpace(entidEnvRaw), "{")

	env := envOverride(map[string]any{
		"HTMLTOPDFCONVERTER_TEST_PDF_GENERATION_ENTID": idmap,
		"HTMLTOPDFCONVERTER_TEST_LIVE":      "FALSE",
		"HTMLTOPDFCONVERTER_TEST_EXPLAIN":   "FALSE",
		"HTMLTOPDFCONVERTER_APIKEY":         "NONE",
	})

	idmapResolved := core.ToMapAny(env["HTMLTOPDFCONVERTER_TEST_PDF_GENERATION_ENTID"])
	if idmapResolved == nil {
		idmapResolved = core.ToMapAny(idmap)
	}

	if env["HTMLTOPDFCONVERTER_TEST_LIVE"] == "TRUE" {
		mergedOpts := vs.Merge([]any{
			map[string]any{
				"apikey": env["HTMLTOPDFCONVERTER_APIKEY"],
			},
			extra,
		})
		client = sdk.NewHtmlToPdfConverterSDK(core.ToMapAny(mergedOpts))
	}

	live := env["HTMLTOPDFCONVERTER_TEST_LIVE"] == "TRUE"
	return &entityTestSetup{
		client:        client,
		data:          entityData,
		idmap:         idmapResolved,
		env:           env,
		explain:       env["HTMLTOPDFCONVERTER_TEST_EXPLAIN"] == "TRUE",
		live:          live,
		syntheticOnly: live && !idmapOverridden,
		now:           time.Now().UnixMilli(),
	}
}
