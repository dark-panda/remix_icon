# frozen_string_literal: true

require File.expand_path('lib/remix_icon/version', __dir__)

Gem::Specification.new do |s|
  s.name = 'remix_icon'
  s.version = RemixIcon::VERSION

  s.required_rubygems_version = Gem::Requirement.new('>= 0') if s.respond_to? :required_rubygems_version=
  s.required_ruby_version = '>= 2.7'

  s.authors = ['J Smith']
  s.description = 'Ruby on Rails helpers for the Remix Icon library.'
  s.summary = s.description
  s.email = 'dark.panda@gmail.com'
  s.license = 'Apache-2.0'
  s.files = `git ls-files`.split($OUTPUT_RECORD_SEPARATOR)
  s.executables = s.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  s.test_files = s.files.grep(%r{^(test|spec|features)/})
  s.homepage = 'http://github.com/dark-panda/remix_icon'
  s.require_paths = ['lib']

  s.metadata = {
    'rubygems_mfa_required' => 'true'
  }
end
