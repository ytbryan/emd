require 'rake/testtask' # required for Rake::TestTask

desc 'Run the test suites'
Rake::TestTask.new do |t|
  files = ARGV[1..-1]
  files = "test/**/*_test.rb" if !files || files.length == 0 # run every _test.rb inside test directory
  t.libs << "test"
  t.libs << "lib/**/*"
  t.test_files = FileList[files]
  t.verbose = true
  t.warning = false
end

task default: :test
