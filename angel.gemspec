Gem::Specification.new do |s|
  s.name = %q{angel}
  s.version = "1.0.0"

  s.specification_version = 2 if s.respond_to? :specification_version=

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Geoff Garside"]
  s.cert_chain = ["/Users/ggarside/.gem/gem-public_cert.pem"]
  s.date = %q{2008-06-14}
  s.description = %q{Helper methods for use with God, see wiki for example}
  s.email = ["geoff@geoffgarside.co.uk"]
  s.extra_rdoc_files = ["History.txt", "License.txt", "Manifest.txt", "PostInstall.txt", "README.txt", "website/index.txt"]
  s.files = ["History.txt", "License.txt", "Manifest.txt", "PostInstall.txt", "README.txt", "Rakefile", "config/hoe.rb", "config/requirements.rb", "lib/angel.rb", "lib/angel/servers.rb", "lib/angel/servers/ebb.rb", "lib/angel/servers/mongrel.rb", "lib/angel/servers/thin.rb", "lib/angel/version.rb", "script/console", "script/destroy", "script/generate", "script/txt2html", "setup.rb", "tasks/deployment.rake", "tasks/environment.rake", "tasks/website.rake", "test/test_angel.rb", "test/test_helper.rb", "website/index.html", "website/index.txt", "website/javascripts/rounded_corners_lite.inc.js", "website/stylesheets/screen.css", "website/template.html.erb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/geoffgarside/angel}
  s.post_install_message = %q{
For more information on angel, see http://github.com/geoffgarside/angel

Require this 'angel' into your god scripts to use it.


}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{angel}
  s.rubygems_version = %q{1.1.1}
  s.signing_key = %q{/Users/ggarside/.gem/gem-private_key.pem}
  s.summary = %q{Helper methods for use with God, see wiki for example}
  s.test_files = ["test/test_angel.rb", "test/test_helper.rb"]
end
