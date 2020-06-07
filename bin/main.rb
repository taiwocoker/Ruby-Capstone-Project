require_relative '../lib/css_checker.rb'
require 'colorize'

path = ARGV[0]
errors = ''

puts '---------------------------------'
puts 'Welcome to CSS Linter!'.blue
puts '---------------------------------'
puts ''
puts 'Scanning file for possible errors...'.yellow
puts ''
CssChecker.linter(path, errors)
puts ''
puts 'Done!'.green