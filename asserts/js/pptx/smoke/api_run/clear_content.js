builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oSlide.RemoveAllObjects();
oFill = Api.CreateSolidFill(Api.CreateRGBColor(61, 74, 107));
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke);
oShape.SetPosition(608400, 1267200);
oDocContent = oShape.GetDocContent();
oParagraph = oDocContent.GetElement(0);
oRun = Api.CreateRun();
oRun.SetFontSize(30);
oRun.AddText("This is just a sample text. ");
oRun.AddText("But you will not see it in the resulting document, as it will be cleared.");
oParagraph.AddElement(oRun);
oRun.ClearContent();
oParagraph = Api.CreateParagraph();
oRun = Api.CreateRun();
oRun.AddText("The text in the previous paragraph cannot be seen, as it has been cleared.");
oParagraph.AddElement(oRun);
oDocContent.Push(oParagraph);
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "ClearContent.pptx");
builder.CloseFile();