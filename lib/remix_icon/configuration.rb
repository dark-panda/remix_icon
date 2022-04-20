# frozen_string_literal: true

module RemixIcon
  class Configuration
    attr_accessor :default_options

    def initialize
      @default_options = {}
    end
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configuration=(config)
    @configuration = config
  end

  def self.configure
    yield configuration
  end
end
