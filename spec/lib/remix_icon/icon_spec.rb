# frozen_string_literal: true

require 'spec_helper'

RSpec.describe RemixIcon::Icon do
  describe '.render' do
    it 'renders an icon' do
      expect(described_class.render(name: 'system/check-fill')).to have_remix_icon('system/check-fill')
    end

    it 'renders an icon with :options' do
      expect(described_class.render(name: 'system/check-fill', options: { fill: 'currentColor' })).to have_selector('svg[fill="currentColor"]')
    end

    it 'renders an icon with :path_options' do
      expect(described_class.render(name: 'system/check-fill', path_options: { fill: 'currentColor' })).to have_selector('svg path[fill="currentColor"]')
    end

    it 'raises an exception on missing icons' do
      expect {
        described_class.render(name: 'nonsense')
      }.to raise_error(RemixIcon::IconNotFoundError)
    end

    it 'handles custom icons' do
      expect(described_class.render(name: 'simple/circle')).to have_remix_icon('simple/circle')
    end
  end
end
