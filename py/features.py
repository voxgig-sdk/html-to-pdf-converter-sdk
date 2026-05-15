# HtmlToPdfConverter SDK feature factory

from feature.base_feature import HtmlToPdfConverterBaseFeature
from feature.test_feature import HtmlToPdfConverterTestFeature


def _make_feature(name):
    features = {
        "base": lambda: HtmlToPdfConverterBaseFeature(),
        "test": lambda: HtmlToPdfConverterTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
