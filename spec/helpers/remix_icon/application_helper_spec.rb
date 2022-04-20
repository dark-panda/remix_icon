# frozen_string_literal: true

require 'spec_helper'
require 'remix_icon/application_helper'
require 'action_view/helpers/output_safety_helper'

RSpec.describe RemixIcon::ApplicationHelper do
  include ActionView::Helpers::JavaScriptHelper
  include ActionView::Helpers::OutputSafetyHelper
  include ActionView::Helpers::TagHelper
  include described_class

  describe '.render' do
    it 'renders an icon' do
      expect(remix_icon('system/check-fill')).to have_remix_icon('system/check-fill')
    end

    it 'renders an icon with :options' do
      expect(remix_icon('system/check-fill', options: { fill: 'currentColor' })).to have_selector('svg[fill="currentColor"]')
    end

    it 'renders an icon with :path_options' do
      expect(remix_icon('system/check-fill', path_options: { fill: 'currentColor' })).to have_selector('svg path[fill="currentColor"]')
    end

    it 'renders a JavaScript console alert for missing icons' do
      expect(remix_icon('nonsense')).to have_selector('script', visible: :hidden, text: 'console.warn("RemixIcon: Failed to find RemixIcon: nonsense")')
    end

    it 'handles custom icons' do
      expect(remix_icon('simple/circle')).to have_remix_icon('simple/circle')
    end
  end
end
