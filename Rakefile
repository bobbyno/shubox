require 'rubygems'
gem 'hoe', '>= 2.1.0'
require 'hoe'
require 'fileutils'
require './lib/shubox'

Hoe.plugin :newgem

# require 'rubygems' unless ENV['NO_RUBYGEMS']
# %w[rake rake/clean fileutils newgem rubigen].each { |f| require f }
# require File.dirname(__FILE__) + '/lib/shubox'

# Generate all the Rake tasks
# Run 'rake -T' to see list of generated tasks (from gem root directory)
$hoe = Hoe.spec 'shubox' do |p|
  p.developer('Bobby Norton', 'codeculturist@gmail.com')
  p.changes = p.paragraphs_of("History.txt", 0..1).join("\n\n")
  p.post_install_message = 'PostInstall.txt' # TODO remove if post-install message not required
  p.rubyforge_name = p.name # TODO this is default value
  p.extra_deps = [
    ['newgem', ">= #{::Newgem::VERSION}"]
  ]
  p.clean_globs |= %w[**/.DS_Store tmp *.log]
  path = (p.rubyforge_name == p.name) ? p.rubyforge_name : "\#{p.rubyforge_name}/\#{p.name}"
  p.remote_rdoc_dir = File.join(path.gsub(/^#{p.rubyforge_name}\/?/,''), 'rdoc')
  p.rsync_args = '-av --delete --ignore-errors'
end

require 'newgem/tasks' # load /tasks/*.rake
Dir['tasks/**/*.rake'].each { |t| load t }

# TODO - want other tests/tasks run by default? Add them to the list
# task :default => [:spec, :features]

desc "Create the gem and install it"
task :dev => [:clean, :manifest, :clean_manifest, :gemspec, :package, :install_gem]

desc "Strip out the entries in the .git folder for ppl who haven't updated .hoerc" 
task :clean_manifest do 
  manifest = IO.readlines("Manifest.txt")
  clean = manifest.reject {|item| item =~ /.git/ }
  File.open("Manifest.txt", mode_string="w" ) {|file| file.puts(clean)}
end

task :clean do
  rm_f("shubox.gemspec")
end