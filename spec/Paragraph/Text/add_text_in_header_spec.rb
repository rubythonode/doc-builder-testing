require 'bundler/setup'
require 'rspec'
require_relative '../../../lib/doc_builder_testing'

describe 'Add text in header' do
  it 'Check enter text in header' do
    docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/Paragraph/Text/add_text_in_header.js')
    expect(docx.notes.first.elements[1].character_style_array.first.text).to eq('header')
  end
end
