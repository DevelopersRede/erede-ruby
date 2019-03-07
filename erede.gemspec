lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "erede/version"

Gem::Specification.new do |spec|
  spec.name = 'erede'
  spec.version = EREDE::VERSION
  spec.authors = ['Rede']
  spec.email = ['neto.joaobatista@gmail.com']

  spec.summary = "SDK eRede"
  spec.description = "SDK de integração eRede"
  spec.homepage = 'https://github.com/developersrede/erede-ruby'
  spec.license = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject {|f| f.match(%r{^(test|spec|features)/})}
  end

  spec.require_paths = ["lib"]
  spec.add_dependency "bundler", "~> 2.0"
  spec.add_dependency "json", "~> 2.2"
end
