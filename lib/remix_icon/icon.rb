# frozen_string_literal: true

require 'action_view/helpers/asset_url_helper'

module RemixIcon
  class IconNotFoundError < RuntimeError
    def initialize(name)
      super("RemixIcon: Failed to find RemixIcon: #{name}")
    end
  end

  class Icon
    include ActionView::Helpers::AssetUrlHelper

    attr_reader :name, :options, :path_options

    def initialize(name:, options: {}, path_options: {})
      @name = name
      @options = options
      @path_options = path_options
    end

    def render
      svg['data-remix-icon-name'] = name

      add_path_options

      add_default_options

      doc
    end

    private

      def doc
        @doc ||= Nokogiri::HTML::DocumentFragment.parse(file)
      end

      def svg
        @svg ||= doc.at_css 'svg'
      end

      def add_path_options
        path_options.each do |key, value|
          attribute = key.to_s.dasherize

          svg.css("path[#{attribute}]").each do |item|
            item[attribute] = value.to_s
          end
        end
      end

      def add_default_options
        options.reverse_merge(RemixIcon.configuration.default_options).each do |key, value|
          svg[key.to_s] = value
        end
      end

      def file
        @file ||= file_path.read.force_encoding('UTF-8')
      rescue Errno::ENOENT
        raise IconNotFoundError, name
      end

      def file_path
        file_path = Rails.root.join("app/assets/images/remix_icon/#{name}.svg")

        return file_path if file_path.exist?

        RemixIcon.root.join("app/assets/images/remix_icon/#{name}.svg")
      end

      class << self
        def render(**kwargs)
          new(**kwargs).render
        end
      end
  end
end
