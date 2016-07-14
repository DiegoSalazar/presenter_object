# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'presenter_object/version'

Gem::Specification.new do |spec|
  spec.name          = "presenter_object"
  spec.version       = PresenterObject::VERSION
  spec.authors       = ["Diego Salazar"]
  spec.email         = ["diego.salazar@kipusystems.com"]
  spec.license       = "MIT"
  spec.summary       = %q{Prsenter object base class.}
  spec.description   = %q{Useful for wrapping model objects with presentation methods.}
  spec.homepage      = "https://github.com/DiegoSalazar/presenter_object"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.5"
  spec.add_development_dependency "activesupport", "~> 4.2"
end
