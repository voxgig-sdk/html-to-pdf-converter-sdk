# HtmlToPdfConverter SDK utility: make_context

from htmltopdfconverter_sdk.core.context import HtmlToPdfConverterContext


def make_context_util(ctxmap, basectx):
    return HtmlToPdfConverterContext(ctxmap, basectx)
