ENV['CONSOLE_DEVICE'] ||= 'stdout'
ENV['LOG_LEVEL'] ||= '_min'

puts RUBY_DESCRIPTION

bundler_standalone_loader = 'gems/bundler/setup'

begin
  require_relative bundler_standalone_loader
rescue LoadError
  puts "WARNING: Standalone bundle loader is not at #{bundler_standalone_loader}. Using Bundler to load gems."
  require "bundler/setup"
  Bundler.require
end

lib_dir = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift lib_dir unless $LOAD_PATH.include?(lib_dir)

require 'eventide/postgres'
require 'consumer/postgres'
require 'try'

require 'test_bench'; TestBench.activate

require 'pp'
