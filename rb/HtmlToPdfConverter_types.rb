# frozen_string_literal: true

# Typed models for the HtmlToPdfConverter SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# PdfGeneration entity data model.
#
# @!attribute [rw] html
#   @return [String]
PdfGeneration = Struct.new(
  :html,
  keyword_init: true
)

# Request payload for PdfGeneration#create.
#
# @!attribute [rw] html
#   @return [String]
PdfGenerationCreateData = Struct.new(
  :html,
  keyword_init: true
)

