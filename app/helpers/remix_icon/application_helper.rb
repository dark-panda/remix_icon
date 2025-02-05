# frozen_string_literal: true

module RemixIcon
  module ApplicationHelper
    class HelperSingleton
      include Singleton
      include ActionView::Helpers::JavaScriptHelper
      include ActionView::Helpers::TagHelper
    end

    def remix_icon(name, options: {}, path_options: {})
      RemixIcon::Icon.render(
        name: name,
        options: options,
        path_options: path_options
      ).to_s.html_safe
    rescue RemixIcon::IconNotFoundError
      return if Rails.env.production?

      HelperSingleton.instance.javascript_tag(%{console.warn("RemixIcon: Failed to find RemixIcon: #{name}")})
    end
  end
end
