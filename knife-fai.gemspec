$:.unshift(File.dirname(__FILE__) + '/lib')
require 'knife-fai/version'

Gem::Specification.new do |s|
  s.name = 'knife-fai'
  s.version = KnifeFai::VERSION
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true
  s.extra_rdoc_files = ["README.rdoc", "LICENSE" ]
  s.summary = "FAI Support for Chef's Knife Command"
  s.description = s.summary
  s.author = "Jason Cook"
  s.email = "jasonc@simpleideas.org"
  s.homepage = "http://wiki.opscode.com/display/chef"

  s.add_dependency "chef", ">= 0.10"
  s.require_path = 'lib'
  s.files = %w(LICENSE README.rdoc) + Dir.glob("lib/**/*")
end