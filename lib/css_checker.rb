require_relative '../lib/load.rb'
module CssChecker
  def self.check(file)
    errors = []
    lines = File.open(file).to_a

    if lines.size.positive?
      check = Load.new
      check.space_after_comma_check(lines,errors)
      check.trailing_space_check(lines, errors)
      check.last_line_check(lines,errors)
    end
    errors
  end
end