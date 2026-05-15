package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewPdfGenerationEntityFunc func(client *HtmlToPdfConverterSDK, entopts map[string]any) HtmlToPdfConverterEntity

