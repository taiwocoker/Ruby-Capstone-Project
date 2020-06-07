require_relative '../lib/load.rb'
module CssChecker
  def self.check(file)
    errors = []
    lines = File.open(file).to_a

    if lines.size.positive?
      check = Load.new
    
      check.trailing_space_check(lines, errors)
    
    end
    errors
  end
end