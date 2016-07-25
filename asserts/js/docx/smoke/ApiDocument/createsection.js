builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is a new paragraph.");
oParagraph.AddLineBreak();
oParagraph.AddText("Scroll down to see the new section.");
var oSection1 = oDocument.CreateSection(oParagraph);
oSection1.SetEqualColumns(1, 720);
oSection1.SetPageSize(12240, 15840);
oSection1.SetPageMargins(1440, 1440, 1440, 1440);
oSection1.SetHeaderDistance(720);
oSection1.SetFooterDistance(576);
oParagraph = Api.CreateParagraph();
oParagraph.SetSpacingBefore(100, true);
oParagraph.SetSpacingAfter(360);
oParagraph.AddText("This is a paragraph in a new section");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "CreateSection.docx");
builder.CloseFile();