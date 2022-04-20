# frozen_string_literal: true

require 'remix_icon/engine'
require 'remix_icon/icon'
require 'remix_icon/configuration'

module RemixIcon
  def self.root
    Pathname.new("#{__dir__}/..")
  end

  autoload :Matchers, root.join('lib/remix_icon/matchers')
end
