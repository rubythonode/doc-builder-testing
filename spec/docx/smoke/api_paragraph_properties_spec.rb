require 'spec_helper'
describe 'ApiParaPr section tests' do
  it 'ApiParaPr | GetClassType method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/getclasstype.js')
    expect(docx.elements[1].character_style_array.first.text).to eq('Class Type = paraPr')
  end

  it 'ApiParaPr | SetBetweenBorder method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setbetweenborder.js')
    expect(docx.elements.first.borders.between.color).to eq(OoxmlParser::Color.new(0, 255, 0))
    expect(docx.elements.first.borders.between.sz).to eq(OoxmlParser::OoxmlSize.new(24, :one_eighth_point))
    expect(docx.elements.first.borders.between.space).to eq(OoxmlParser::OoxmlSize.new(0.0, :point))
  end

  it 'ApiParaPr | SetBottomBorder method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setbottomborder.js')
    expect(docx.elements.first.borders.bottom.color).to eq(OoxmlParser::Color.new(0, 255, 0))
    expect(docx.elements.first.borders.bottom.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
    expect(docx.elements.first.borders.bottom.sz).to eq(OoxmlParser::OoxmlSize.new(24, :one_eighth_point))
  end

  it 'ApiParaPr | SetContextualSpacing method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setcontextualspacing.js')
    expect(docx.elements[0].contextual_spacing).to be_falsey
    expect(docx.elements[1].contextual_spacing).to be_falsey
    expect(docx.elements[2].contextual_spacing).to be_truthy
    expect(docx.elements[3].contextual_spacing).to be_truthy
  end

  it 'ApiParaPr | SetIndFirstLine method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setindfirstline.js')
    expect(docx.elements.first.ind.first_line_indent).to eq(OoxmlParser::OoxmlSize.new(1440.0, :twip))
    expect(docx.elements[1].ind.first_line_indent).to eq(OoxmlParser::OoxmlSize.new(1440.0, :twip))
  end

  it 'ApiParaPr | SetIndLeft method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setindleft.js')
    expect(docx.elements.first.ind.left_indent).to eq(OoxmlParser::OoxmlSize.new(2880, :twip))
    expect(docx.elements[1].ind.left_indent).to eq(OoxmlParser::OoxmlSize.new(2880, :twip))
  end

  it 'ApiParaPr | SetIndRight method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setindright.js')
    expect(docx.elements.first.ind.right_indent).to eq(OoxmlParser::OoxmlSize.new(2880, :twip))
    expect(docx.elements[1].ind.right_indent).to eq(OoxmlParser::OoxmlSize.new(2880, :twip))
  end

  it 'ApiParaPr | SetJc method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setjc.js')
    expect(docx.elements[0].align).to eq(:left)
    expect(docx.elements[1].align).to eq(:right)
    expect(docx.elements[2].align).to eq(:center)
    expect(docx.elements[3].align).to eq(:justify)
  end

  it 'ApiParaPr | SetKeepLines method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setkeeplines.js')
    expect(docx.elements.first.keep_lines).to be_falsey
    expect(docx.elements[1].keep_lines).to be_falsey
    expect(docx.elements[2].keep_lines).to be_falsey
    expect(docx.elements[3].keep_lines).to be_falsey
    expect(docx.elements[4].keep_lines).to be_falsey
    expect(docx.elements[5].keep_lines).to be_falsey
    expect(docx.elements[6].keep_lines).to be_truthy
  end

  it 'ApiParaPr | SetKeepNext method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setkeepnext.js')
    expect(docx.elements.first.keep_next).to be_falsey
    expect(docx.elements[1].keep_next).to be_truthy
    expect(docx.elements[2].keep_next).to be_truthy
    expect(docx.elements[3].keep_next).to be_truthy
    expect(docx.elements[4].keep_next).to be_truthy
    expect(docx.elements[5].keep_next).to be_truthy
    expect(docx.elements[6].keep_next).to be_falsey
  end

  it 'ApiParaPr | SetLeftBorder method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setleftborder.js')
    expect(docx.elements.first.borders.left.color).to eq(OoxmlParser::Color.new(0, 255, 0))
    expect(docx.elements.first.borders.left.space).to eq(OoxmlParser::OoxmlSize.new(0.0, :point))
    expect(docx.elements.first.borders.left.sz).to eq(OoxmlParser::OoxmlSize.new(24, :one_eighth_point))
  end

  it 'ApiParaPr | SetNumPr method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setnumpr.js')
    expect(docx.elements.last.style.name).to eq('My document style')
    expect(docx.elements.last.numbering.ilvl).to eq(0)
    docx.elements[1..8].each_with_index do |current_element, index|
      expect(current_element.numbering.ilvl).to eq(index)
    end
  end

  it 'ApiParaPr | SetPageBreakBefore method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setpagebreakbefore.js')
    expect(docx.elements.first.page_break).to be_falsey
    expect(docx.elements[1].page_break).to be_truthy
  end

  it 'ApiParaPr | SetRightBorder method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setrightborder.js')
    expect(docx.elements.first.borders.right.color).to eq(OoxmlParser::Color.new(0, 255, 0))
    expect(docx.elements.first.borders.right.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
    expect(docx.elements.first.borders.right.sz).to eq(OoxmlParser::OoxmlSize.new(24, :one_eighth_point))
  end

  it 'ApiParaPr | SetShd method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setshd.js')
    expect(docx.elements.first.background_color).to eq(OoxmlParser::Color.new(0, 255, 0))
    expect(docx.elements.first.character_style_array[1].text).to eq('This is an example of setting a shading to a paragraph. ')
    expect(docx.elements.first.character_style_array[2].text).to eq('These sentences are used to add lines for demonstrative purposes. ')
    expect(docx.elements.first.character_style_array[3].text).to eq('These sentences are used to add lines for demonstrative purposes. ')
    expect(docx.elements.first.character_style_array[4].text).to eq('These sentences are used to add lines for demonstrative purposes. ')
    expect(docx.elements.first.character_style_array[5].text).to eq('These sentences are used to add lines for demonstrative purposes. ')
  end

  it 'ApiParaPr | SetSpacingAfter method' do
    skip 'Parser error https://github.com/ONLYOFFICE/ooxml_parser/issues/199'
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setspacingafter.js')
    expect(docx.elements.first.spacing.after).to eq(OoxmlParser::OoxmlSize.new(1440, :twip))
  end

  it 'ApiParaPr | SetSpacingBefore method' do
    skip 'Parser error https://github.com/ONLYOFFICE/ooxml_parser/issues/199'
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setspacingbefore.js')
    expect(docx.elements.first.spacing.before).to eq(OoxmlParser::OoxmlSize.new(1440, :twip))
  end

  it 'ApiParaPr | SetSpacingLine method' do
    skip 'Parser error https://github.com/ONLYOFFICE/ooxml_parser/issues/199'
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setspacingline.js')
    expect(docx.elements.first.spacing.line).to eq(OoxmlParser::OoxmlSize.new(720, :twip))
    expect(docx.elements.first.spacing.line_rule).to eq(:auto)
    expect(docx.elements[1].spacing.line).to eq(OoxmlParser::OoxmlSize.new(200, :twip))
    expect(docx.elements[1].spacing.line_rule).to eq(:exact)
    expect(docx.elements[2].spacing.line).to eq(OoxmlParser::OoxmlSize.new(400, :twip))
    expect(docx.elements[2].spacing.line_rule).to eq(:at_least)
  end

  it 'ApiParaPr | SetStyle method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setstyle.js')
    expect(docx.elements.first.character_style_array[1].text).to eq('This is a text in a paragraph styled with the \'Heading 6\' style.')
    expect(docx.elements.first.style.name).to eq('Heading 6')
  end

  it 'ApiParaPr | SetTabs method' do
    skip 'Parser error https://github.com/ONLYOFFICE/ooxml_parser/issues/199'
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/settabs.js')
    expect(docx.elements.first.tabs.first.position).to eq(OoxmlParser::OoxmlSize.new(1440, :twips))
    expect(docx.elements.first.tabs.first.align).to eq(:left)
    expect(docx.elements.first.tabs[1].position).to eq(OoxmlParser::OoxmlSize.new(4320, :twips))
    expect(docx.elements.first.tabs[1].align).to eq(:center)
    expect(docx.elements.first.tabs[2].position).to eq(OoxmlParser::OoxmlSize.new(7200, :twips))
    expect(docx.elements.first.tabs[2].align).to eq(:right)
  end

  it 'ApiParaPr | SetTopBorder method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/settopborder.js')
    expect(docx.elements.first.borders.top.color).to eq(OoxmlParser::Color.new(0, 255, 0))
    expect(docx.elements.first.borders.top.sz).to eq(OoxmlParser::OoxmlSize.new(24, :one_eighth_point))
    expect(docx.elements.first.borders.top.space).to eq(OoxmlParser::OoxmlSize.new(0, :point))
  end

  it 'ApiParaPr | SetWidowControl method' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParaPr/setwidowcontrol.js')
    expect(docx.elements[5].orphan_control).to be_truthy
  end
end
