# -*- encoding: utf-8 -*-
VERSION = "0.1"

Gem::Specification.new do |spec|
  spec.name          = "motioncv"
  spec.version       = VERSION
  spec.authors       = ["iwazer"]
  spec.email         = ["iwazawa@gmail.com"]
  spec.description   = %q{RubyMotion OpenCV library}
  spec.summary       = %q{RubyMotion OpenCV library}
  spec.homepage      = ""
  spec.license       = ""

  files = []
  files << 'README.md'
  files.concat(Dir.glob('framework/opencv2.framework/**/*'))
  files.concat(Dir.glob('lib/**/*.rb'))
  spec.files         = files
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake"
end
