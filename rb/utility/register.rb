# HtmlToPdfConverter SDK utility registration
require_relative '../core/utility_type'
require_relative 'clean'
require_relative 'done'
require_relative 'make_error'
require_relative 'feature_add'
require_relative 'feature_hook'
require_relative 'feature_init'
require_relative 'fetcher'
require_relative 'make_fetch_def'
require_relative 'make_context'
require_relative 'make_options'
require_relative 'make_request'
require_relative 'make_response'
require_relative 'make_result'
require_relative 'make_point'
require_relative 'make_spec'
require_relative 'make_url'
require_relative 'param'
require_relative 'prepare_auth'
require_relative 'prepare_body'
require_relative 'prepare_headers'
require_relative 'prepare_method'
require_relative 'prepare_params'
require_relative 'prepare_path'
require_relative 'prepare_query'
require_relative 'result_basic'
require_relative 'result_body'
require_relative 'result_headers'
require_relative 'transform_request'
require_relative 'transform_response'

HtmlToPdfConverterUtility.registrar = ->(u) {
  u.clean = HtmlToPdfConverterUtilities::Clean
  u.done = HtmlToPdfConverterUtilities::Done
  u.make_error = HtmlToPdfConverterUtilities::MakeError
  u.feature_add = HtmlToPdfConverterUtilities::FeatureAdd
  u.feature_hook = HtmlToPdfConverterUtilities::FeatureHook
  u.feature_init = HtmlToPdfConverterUtilities::FeatureInit
  u.fetcher = HtmlToPdfConverterUtilities::Fetcher
  u.make_fetch_def = HtmlToPdfConverterUtilities::MakeFetchDef
  u.make_context = HtmlToPdfConverterUtilities::MakeContext
  u.make_options = HtmlToPdfConverterUtilities::MakeOptions
  u.make_request = HtmlToPdfConverterUtilities::MakeRequest
  u.make_response = HtmlToPdfConverterUtilities::MakeResponse
  u.make_result = HtmlToPdfConverterUtilities::MakeResult
  u.make_point = HtmlToPdfConverterUtilities::MakePoint
  u.make_spec = HtmlToPdfConverterUtilities::MakeSpec
  u.make_url = HtmlToPdfConverterUtilities::MakeUrl
  u.param = HtmlToPdfConverterUtilities::Param
  u.prepare_auth = HtmlToPdfConverterUtilities::PrepareAuth
  u.prepare_body = HtmlToPdfConverterUtilities::PrepareBody
  u.prepare_headers = HtmlToPdfConverterUtilities::PrepareHeaders
  u.prepare_method = HtmlToPdfConverterUtilities::PrepareMethod
  u.prepare_params = HtmlToPdfConverterUtilities::PrepareParams
  u.prepare_path = HtmlToPdfConverterUtilities::PreparePath
  u.prepare_query = HtmlToPdfConverterUtilities::PrepareQuery
  u.result_basic = HtmlToPdfConverterUtilities::ResultBasic
  u.result_body = HtmlToPdfConverterUtilities::ResultBody
  u.result_headers = HtmlToPdfConverterUtilities::ResultHeaders
  u.transform_request = HtmlToPdfConverterUtilities::TransformRequest
  u.transform_response = HtmlToPdfConverterUtilities::TransformResponse
}
