# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'guns/version'

Gem::Specification.new do |spec|
  spec.name          = "guns"
  spec.version       = Guns::VERSION
  spec.authors       = ["Elliot Blackburn"]
  spec.email         = ["Elliot.blackburn@gmail.com"]

  spec.summary       = %q{Tweet when gun crime happens in MURICA}
  spec.description   = %q{I don't like guns and a lot of people keep getting hurt or killed in America because of them. This application will tweet each time a new gun "incident" happens and is reported in America.}
  spec.homepage      = "https://www.twitter.com/elliotblackburn"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
