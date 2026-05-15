package core

type HtmlToPdfConverterError struct {
	IsHtmlToPdfConverterError bool
	Sdk              string
	Code             string
	Msg              string
	Ctx              *Context
	Result           any
	Spec             any
}

func NewHtmlToPdfConverterError(code string, msg string, ctx *Context) *HtmlToPdfConverterError {
	return &HtmlToPdfConverterError{
		IsHtmlToPdfConverterError: true,
		Sdk:              "HtmlToPdfConverter",
		Code:             code,
		Msg:              msg,
		Ctx:              ctx,
	}
}

func (e *HtmlToPdfConverterError) Error() string {
	return e.Msg
}
