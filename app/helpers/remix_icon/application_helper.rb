# frozen_string_literal: true

module RemixIcon
  module ApplicationHelper
    def remix_icon(name, options: {}, path_options: {})
      raw RemixIcon::Icon.render(
        name: name,
        options: options,
        path_options: path_options
      )
    rescue RemixIcon::IconNotFoundError
      return if Rails.env.production?

      javascript_tag(%{console.warn("RemixIcon: Failed to find RemixIcon: #{name}")})
    end
  end
end
