# -*- encoding: utf-8 -*-
# stub: clipboard 1.0.6 ruby lib

Gem::Specification.new do |s|
  s.name = "clipboard"
  s.version = "1.0.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Jan Lelis"]
  s.date = "2015-02-18"
  s.description = "Easy access to the clipboard on Linux, MacOS and Windows (Clipboard.copy & Clipboard.paste)."
  s.email = "mail@janlelis.de"
  s.homepage = "http://github.com/janlelis/clipboard"
  s.requirements = ["On Linux (or other X), you will need xclip. You can install it on debian/ubuntu with: sudo apt-get install xclip", "On Windows, you will need the ffi gem."]
  s.rubygems_version = "2.4.5"
  s.summary = "Easy access to the clipboard on Linux, MacOS and Windows."

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 2"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 2"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 2"])
  end
end
