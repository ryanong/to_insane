require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
 
desc 'Default: run unit tests.'
task :default => :test

desc 'Test the to_insane library.'
Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/test_*.rb'
  t.verbose = false
end

desc 'Generate RDoc documentation.'
Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'to_insane'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "to_insane"
    gemspec.summary = "ToInsane allows you to convert strings and integers to a Base larger than the default max of 36 and use a custom character set"
    gemspec.description = gemspec.summary
    gemspec.email = "ryanong@gmail.com"
    gemspec.homepage = "http://github.com/ryanong/to_insane"
    gemspec.authors = ["Ryan Ong"]  
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end
