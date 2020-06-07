require_relative '../lib/css_checker.rb'
require_relative '../lib/load.rb'
require 'colorize'

file = ARGV[0]

puts '---------------------------------'
puts 'Welcome to CSS Linter!'.blue
puts '---------------------------------'
puts ''
puts 'Scanning file for possible errors...'.yellow
puts ''

puts ''
puts 'Done!'.green

errors = CssChecker.check(file)

if errors.size.positive?
  puts "1 file tested. Checks completed with the following #{errors.size} errors: "
  errors.each { |error| puts '  Error: '.red + "#{error}\n" }
else
  puts '1 file tested. All checks completed with no errors'.green
end
