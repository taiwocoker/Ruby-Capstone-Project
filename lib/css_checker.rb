# frozen_string_literal: true

require_relative '../lib/load.rb'
module CssChecker
  def self.check(file)
    errors = []
    lines = File.open(file).to_a
      check.unexpected_white_space_check(lines,errors)
      check.new_line_check(lines,errors)
      check.space_after_comma_check(lines,errors)
      check.trailing_space_check(lines, errors)
      check.last_line_check(lines,errors)
      check.indentation_check(lines,errors)

    if lines.size.positive?
      check = Load.new
      check.zero_px_check(lines, errors)
    end
    errors
  end
end
