#encoding utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'active_scaffold_list_filters/version'

Gem::Specification.new do |spec|
  spec.name           = "active_scaffold_list_filters"
  spec.version        = ActiveScaffoldListFilters::VERSION
  spec.authors        = ["Zac Zheng"]
  spec.email          = ["zac@zenpow.com"]
  spec.description    = %q{Enhanced and gem-ifield version of Active Scaffold List Filter plugin}
  spec.summary        = %q{Enhancements included are: CSV export functionality and more filters}
  spec.homepage       = "https://github.com/zenpow/active_scaffold_list_filters_gem"
  spec.license        = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency "rails"
end

