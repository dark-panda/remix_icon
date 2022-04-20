# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength
RSpec::Matchers.define :have_remix_icon do |icon|
  attr_reader :icon

  match do |actual|
    return false if actual.blank?

    @icon = icon

    expect_doc_to_have_remix_icon
    expect_icon_to_have_attributes

    true
  end

  failure_message do
    [
      "expected to have RemixIcon '#{icon}'",
      value_description
    ].compact.join(' ')
  end

  failure_message_when_negated do
    [
      "expected not to have RemixIcon '#{icon}'",
      value_description
    ].compact.join(' ')
  end

  description do
    [
      "have RemixIcon '#{icon}'",
      value_description
    ].compact.join(' ')
  end

  def expect_doc_to_have_remix_icon
    expect(doc).to have_selector("svg[data-remix-icon-name='#{icon}']")
  end

  def expect_icon_to_have_attributes
    expect(doc.at("svg[data-remix-icon-name='#{icon}']").attributes).to match(hash_including(@attributes)) if defined?(@attributes)
  end

  def value_description
    return "with variant value #{matcher(@variant).description}" if defined?(@variant)

    "with value #{matcher(@value).description}" if defined?(@value)
  end

  def doc
    return @doc if defined?(@doc)

    @doc = if actual.respond_to?(:to_html)
      actual
    else
      Nokogiri::HTML(actual.to_s).css('body > *')
    end
  end

  def matcher(value)
    if value.is_a?(RSpec::Matchers::BuiltIn::BaseMatcher)
      value
    else
      eq(value)
    end
  end
end
# rubocop:enable Metrics/BlockLength
