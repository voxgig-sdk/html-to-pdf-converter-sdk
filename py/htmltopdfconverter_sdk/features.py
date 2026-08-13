# HtmlToPdfConverter SDK feature factory

from htmltopdfconverter_sdk.feature.base_feature import HtmlToPdfConverterBaseFeature
from htmltopdfconverter_sdk.feature.test_feature import HtmlToPdfConverterTestFeature


def _make_feature(name):
    features = {
        "base": lambda: HtmlToPdfConverterBaseFeature(),
        "test": lambda: HtmlToPdfConverterTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
