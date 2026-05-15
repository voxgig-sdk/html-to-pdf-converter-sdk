<?php
declare(strict_types=1);

// HtmlToPdfConverter SDK utility registration

require_once __DIR__ . '/../core/UtilityType.php';
require_once __DIR__ . '/Clean.php';
require_once __DIR__ . '/Done.php';
require_once __DIR__ . '/MakeError.php';
require_once __DIR__ . '/FeatureAdd.php';
require_once __DIR__ . '/FeatureHook.php';
require_once __DIR__ . '/FeatureInit.php';
require_once __DIR__ . '/Fetcher.php';
require_once __DIR__ . '/MakeFetchDef.php';
require_once __DIR__ . '/MakeContext.php';
require_once __DIR__ . '/MakeOptions.php';
require_once __DIR__ . '/MakeRequest.php';
require_once __DIR__ . '/MakeResponse.php';
require_once __DIR__ . '/MakeResult.php';
require_once __DIR__ . '/MakePoint.php';
require_once __DIR__ . '/MakeSpec.php';
require_once __DIR__ . '/MakeUrl.php';
require_once __DIR__ . '/Param.php';
require_once __DIR__ . '/PrepareAuth.php';
require_once __DIR__ . '/PrepareBody.php';
require_once __DIR__ . '/PrepareHeaders.php';
require_once __DIR__ . '/PrepareMethod.php';
require_once __DIR__ . '/PrepareParams.php';
require_once __DIR__ . '/PreparePath.php';
require_once __DIR__ . '/PrepareQuery.php';
require_once __DIR__ . '/ResultBasic.php';
require_once __DIR__ . '/ResultBody.php';
require_once __DIR__ . '/ResultHeaders.php';
require_once __DIR__ . '/TransformRequest.php';
require_once __DIR__ . '/TransformResponse.php';

HtmlToPdfConverterUtility::setRegistrar(function (HtmlToPdfConverterUtility $u): void {
    $u->clean = [HtmlToPdfConverterClean::class, 'call'];
    $u->done = [HtmlToPdfConverterDone::class, 'call'];
    $u->make_error = [HtmlToPdfConverterMakeError::class, 'call'];
    $u->feature_add = [HtmlToPdfConverterFeatureAdd::class, 'call'];
    $u->feature_hook = [HtmlToPdfConverterFeatureHook::class, 'call'];
    $u->feature_init = [HtmlToPdfConverterFeatureInit::class, 'call'];
    $u->fetcher = [HtmlToPdfConverterFetcher::class, 'call'];
    $u->make_fetch_def = [HtmlToPdfConverterMakeFetchDef::class, 'call'];
    $u->make_context = [HtmlToPdfConverterMakeContext::class, 'call'];
    $u->make_options = [HtmlToPdfConverterMakeOptions::class, 'call'];
    $u->make_request = [HtmlToPdfConverterMakeRequest::class, 'call'];
    $u->make_response = [HtmlToPdfConverterMakeResponse::class, 'call'];
    $u->make_result = [HtmlToPdfConverterMakeResult::class, 'call'];
    $u->make_point = [HtmlToPdfConverterMakePoint::class, 'call'];
    $u->make_spec = [HtmlToPdfConverterMakeSpec::class, 'call'];
    $u->make_url = [HtmlToPdfConverterMakeUrl::class, 'call'];
    $u->param = [HtmlToPdfConverterParam::class, 'call'];
    $u->prepare_auth = [HtmlToPdfConverterPrepareAuth::class, 'call'];
    $u->prepare_body = [HtmlToPdfConverterPrepareBody::class, 'call'];
    $u->prepare_headers = [HtmlToPdfConverterPrepareHeaders::class, 'call'];
    $u->prepare_method = [HtmlToPdfConverterPrepareMethod::class, 'call'];
    $u->prepare_params = [HtmlToPdfConverterPrepareParams::class, 'call'];
    $u->prepare_path = [HtmlToPdfConverterPreparePath::class, 'call'];
    $u->prepare_query = [HtmlToPdfConverterPrepareQuery::class, 'call'];
    $u->result_basic = [HtmlToPdfConverterResultBasic::class, 'call'];
    $u->result_body = [HtmlToPdfConverterResultBody::class, 'call'];
    $u->result_headers = [HtmlToPdfConverterResultHeaders::class, 'call'];
    $u->transform_request = [HtmlToPdfConverterTransformRequest::class, 'call'];
    $u->transform_response = [HtmlToPdfConverterTransformResponse::class, 'call'];
});
