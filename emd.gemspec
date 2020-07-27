# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'emd/version'
require 'emd/post_message'

Gem::Specification.new do |spec|
  spec.name          = "emd"
  spec.version       = Emd::VERSION
  spec.authors       = ["Bryan Lim"]
  spec.email         = ["ytbryan@gmail.com"]
  spec.summary       = %q{Markdown partial and .html.md on Rails View}
  spec.description   = %q{Embedded markdown template for Ruby on Rails}
  spec.homepage      = "https://github.com/ytbryan/emd"
  spec.license       = "MIT"
  spec.require_paths = ["lib"]
  spec.post_install_message = Log::MESSAGE
  spec.files         = Dir["{app,config,lib}/**/*", "LICENSE.txt", "README.md"]

  spec.add_development_dependency "rails"
  spec.add_development_dependency "rspec", "~> 3.9.0"
  spec.add_development_dependency "bundler", "~> 2.1.4"
  spec.add_development_dependency "rake", "~> 13.0.1"
  spec.add_development_dependency 'coderay', "1.1.2"
end
