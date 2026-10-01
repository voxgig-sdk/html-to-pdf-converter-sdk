

import Path from 'node:path'
import * as Fs from 'node:fs'

import { test, describe, afterEach } from 'node:test'
import assert from 'node:assert'
import { createLiveTransport } from '../../live-runner'
import { runLiveEntity } from '../../live-entity'


import { HtmlToPdfConverterSDK, BaseFeature, stdutil } from '../../..'

import {
  envOverride,
  liveClientOptions,
  liveDelay,
  loadEnvLocal,
  makeCtrl,
  makeMatch,
  makeReqdata,
  makeStepData,
  makeValid,
  maybeSkipControl,
} from '../../utility'


loadEnvLocal(__dirname + '/../../../.env.local')


describe('PdfGenerationEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when HTML_TO_PDF_CONVERTER_TEST_LIVE=TRUE.
  afterEach(liveDelay('HTML_TO_PDF_CONVERTER_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = HtmlToPdfConverterSDK.test()
    const ent = testsdk.PdfGeneration()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.HTML_TO_PDF_CONVERTER_TEST_LIVE
    for (const op of ['create']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'pdf_generation.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{"html":{"a":true,"h":"Html","n":"html","r":true,"sh":"HTML source code to convert to PDF","t":"`$STRING`","key$":"html","index$":0}},"name":"pdf_generation","op":{"create":{"input":"data","name":"create","points":[{"a":true,"co":{"id":"POST /generate","source":"openapi3","version":2},"g":{},"k":"http","m":"POST","o":"/generate","q":{},"r":{},"s":[{"lit":"generate"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"create"}},"relations":{"ancestors":[]},"key$":"pdf_generation","name__orig":"pdf_generation","Name":"PdfGeneration","name_":"pdf_generation","name-":"pdf-generation","NAME":"PDF_GENERATION","index$":0}, {"active":true,"entity":"pdf_generation","key$":"BasicPdfGenerationFlow","kind":"basic","name":"BasicPdfGenerationFlow","param":{},"step":[{"a":true,"d":{},"i":{"ref":"pdf_generation_ref01"},"m":{},"o":"create","s":[],"v":[],"index$":0}]}, 'PdfGeneration', {"POST /generate":{"protocol":"http","requestBody":{"required":true,"content":{"application/json":{"schema":{"type":"object","required":["html"],"properties":{"html":{"type":"string","description":"HTML source code to convert to PDF","example":"<!DOCTYPE html><html><head><title>Sample Document</title></head><body><h1>Hello World</h1><p>This is a sample HTML document.</p></body></html>","key$":"html"}},"index$":1},"examples":{"simple":{"summary":"Simple HTML example","value":{"html":"<!DOCTYPE html><html><head><title>Test</title></head><body><h1>Hello World</h1></body></html>"}}}}}},"parameters":[]}})
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const pdf_generation_ref01_ent = client.PdfGeneration()
    let pdf_generation_ref01_data = setup.data.new.pdf_generation['pdf_generation_ref01']

    pdf_generation_ref01_data = (await pdf_generation_ref01_ent.create(pdf_generation_ref01_data)).data()
    assert(null != pdf_generation_ref01_data)


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/pdf_generation/PdfGenerationTestData.json')

  // TODO: file ready util needed?
  const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8')

  // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
  const entityData = JSON.parse(entityDataSource)

  options.entity = entityData.existing

  let client = HtmlToPdfConverterSDK.test(options, extra)
  const struct = client.utility().struct
  const merge = struct.merge
  const transform = struct.transform

  let idmap = transform(
    ['pdf_generation01','pdf_generation02','pdf_generation03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'HTML_TO_PDF_CONVERTER_TEST_PDF_GENERATION_ENTID': idmap,
    'HTML_TO_PDF_CONVERTER_TEST_LIVE': 'FALSE',
    'HTML_TO_PDF_CONVERTER_TEST_EXPLAIN': 'FALSE',
  })

  idmap = env['HTML_TO_PDF_CONVERTER_TEST_PDF_GENERATION_ENTID']

  const live = 'TRUE' === env.HTML_TO_PDF_CONVERTER_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['HTML_TO_PDF_CONVERTER_TEST_PDF_GENERATION_ENTID']
    idmap = rawIds && rawIds.trim() ? JSON.parse(rawIds) : {}
    if (!idmap || Array.isArray(idmap) || typeof idmap !== 'object') {
      throw new Error('Live ENTID must be a JSON object')
    }
    client = new HtmlToPdfConverterSDK(merge([
      // FIRST, so the generated fields below win: sdk-test-control.json's
      // test.client.options adds to the live client, it does not redirect it.
      liveClientOptions(),
      {
      },
      // 'extra || {}', not a bare 'extra': struct.merge returns UNDEFINED when the
      // last entry is undefined, and basicSetup is normally called with no
      // argument at all - so a bare 'extra' silently discarded the apikey
      // and server values above and handed the SDK undefined. Harmless
      // while there was nothing in that object; not harmless now.
      extra || {},
      { system: { fetch: transport.fetch } }
    ]))
  }

  const setup = {
    idmap,
    env,
    options,
    client,
    struct,
    data: entityData,
    explain: 'TRUE' === env.HTML_TO_PDF_CONVERTER_TEST_EXPLAIN,
    live,
    transport,
    now: Date.now(),
  }

  return setup
}
  
