
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rspec/ensure/unfiltered/version"

Gem::Specification.new do |spec|
  spec.name          = "rspec-ensure-unfiltered"
  spec.version       = RSpec::Ensure::Unfiltered::VERSION
  spec.authors       = ["Rob Howard"]
  spec.email         = ["rob@robhoward.id.au"]

  spec.summary       = %q{A plugin for ensuring your RSpec tests don't run with a filter (eg. `focus: true`); useful for CI runs.}
  spec.homepage      = "https://github.com/damncabbage/rspec-ensure-unfiltered"
  spec.license       = "Apache-2.0"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rspec", "~> 3.0"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
end
