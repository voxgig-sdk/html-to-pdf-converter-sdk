# HtmlToPdfConverter SDK exists test

import pytest
from htmltopdfconverter_sdk import HtmlToPdfConverterSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = HtmlToPdfConverterSDK.test(None, None)
        assert testsdk is not None
