# frozen_string_literal: true

Bundler.require(:guard)

spec_set = proc do
  require 'guard/rspec/dsl'

  dsl = Guard::RSpec::Dsl.new(self)

  ignore(%r{.bundle/})

  # RSpec files
  rspec = dsl.rspec
  watch(rspec.spec_helper) { rspec.spec_dir }
  watch(rspec.spec_files)

  # Rails files
  rails = dsl.rails
  watch(rails.spec_helper) { rspec.spec_dir }

  # Ruby files
  ruby = dsl.ruby
  dsl.watch_spec_files_for(ruby.lib_files)
end

guard :rspec, cmd: 'bundle exec rspec --color --require spec_helper --format documentation --format Nc' do
  instance_eval(&spec_set)
end
