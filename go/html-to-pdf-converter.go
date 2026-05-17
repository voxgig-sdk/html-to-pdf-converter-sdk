package voxgightmltopdfconvertersdk

import (
	"github.com/voxgig-sdk/html-to-pdf-converter-sdk/go/core"
	"github.com/voxgig-sdk/html-to-pdf-converter-sdk/go/entity"
	"github.com/voxgig-sdk/html-to-pdf-converter-sdk/go/feature"
	_ "github.com/voxgig-sdk/html-to-pdf-converter-sdk/go/utility"
)

// Type aliases preserve external API.
type HtmlToPdfConverterSDK = core.HtmlToPdfConverterSDK
type Context = core.Context
type Utility = core.Utility
type Feature = core.Feature
type Entity = core.Entity
type HtmlToPdfConverterEntity = core.HtmlToPdfConverterEntity
type FetcherFunc = core.FetcherFunc
type Spec = core.Spec
type Result = core.Result
type Response = core.Response
type Operation = core.Operation
type Control = core.Control
type HtmlToPdfConverterError = core.HtmlToPdfConverterError

// BaseFeature from feature package.
type BaseFeature = feature.BaseFeature

func init() {
	core.NewBaseFeatureFunc = func() core.Feature {
		return feature.NewBaseFeature()
	}
	core.NewTestFeatureFunc = func() core.Feature {
		return feature.NewTestFeature()
	}
	core.NewPdfGenerationEntityFunc = func(client *core.HtmlToPdfConverterSDK, entopts map[string]any) core.HtmlToPdfConverterEntity {
		return entity.NewPdfGenerationEntity(client, entopts)
	}
}

// Constructor re-exports.
var NewHtmlToPdfConverterSDK = core.NewHtmlToPdfConverterSDK
var TestSDK = core.TestSDK
var NewContext = core.NewContext
var NewSpec = core.NewSpec
var NewResult = core.NewResult
var NewResponse = core.NewResponse
var NewOperation = core.NewOperation
var MakeConfig = core.MakeConfig
var NewBaseFeature = feature.NewBaseFeature
var NewTestFeature = feature.NewTestFeature
