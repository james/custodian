# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{custodian}
  s.version = "0.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["James Darling"]
  s.date = %q{2009-03-14}
  s.description = %q{Custodian is a Ruby gem for accessing the Guardian's Open Platform API (http://www.guardian.co.uk/open-platform)}
  s.email = ["james@coupde.com"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc"]
  s.files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc", "Rakefile", "lib/custodian.rb", "lib/custodian/article.rb", "lib/custodian/article_class.rb", "lib/custodian/tag.rb", "lib/custodian/tag_class.rb", "script/console", "script/destroy", "script/generate", "spec/article_spec.rb", "spec/custodian_spec.rb", "spec/spec.opts", "spec/spec_helper.rb", "tasks/rspec.rake"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/james/custodian}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{custodian}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Custodian is a Ruby gem for accessing the Guardian's Open Platform API (http://www.guardian.co.uk/open-platform)}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<hpricot>, [">= 0"])
      s.add_development_dependency(%q<newgem>, [">= 1.2.3"])
      s.add_development_dependency(%q<hoe>, [">= 1.8.0"])
    else
      s.add_dependency(%q<hpricot>, [">= 0"])
      s.add_dependency(%q<newgem>, [">= 1.2.3"])
      s.add_dependency(%q<hoe>, [">= 1.8.0"])
    end
  else
    s.add_dependency(%q<hpricot>, [">= 0"])
    s.add_dependency(%q<newgem>, [">= 1.2.3"])
    s.add_dependency(%q<hoe>, [">= 1.8.0"])
  end
end
