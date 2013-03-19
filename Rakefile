require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new do |test|
	test.libs << "test" << "lib"
	test.test_files = Dir[ "test/test-*.rb" ] 
	test.verbose = true
end

task :default => [:test]

