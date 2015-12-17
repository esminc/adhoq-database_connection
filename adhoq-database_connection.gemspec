# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'adhoq/database_connection/version'

Gem::Specification.new do |spec|
  spec.name          = "adhoq-database_connection"
  spec.version       = Adhoq::DatabaseConnection::VERSION
  spec.authors       = ["takkanm"]
  spec.email         = ["takkanm@gmail.com"]

  spec.summary       = %q{helper to use other database in adhoq}
  spec.description   = %q{helper to use other database in adhoq}
  spec.homepage      = "https://github.com/esminc/adhoq-database_connection"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'adhoq', '~> 0.0.6'

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec', '~> 3.4.0'
  spec.add_development_dependency 'sqlite3', '1.3.11'
end
