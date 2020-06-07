module CheckSpace
    # rubocop:disable Metrics/CyclomaticComplexity
    def trailing_space_check(lines, errors)
        lines.each_with_index do |line, index|
          errors << "Trailing space found on line #{index + 1}." if line.end_with?("; \n")
        end
        errors
    end

    def last_line_check(lines, errors)
        errors << 'Last line in the file should be empty.' unless lines.last.include? "\n"
    end

    def space_after_comma_check(lines, errors)
        lines.each_with_index do |line, index|
          next unless line.include?(',')
    
          errors << "Expected single space after comma on line #{index + 1}" unless line =~ /[[:space:]]\,/
        end
        errors
      end
    
    # rubocop:enable Metrics/CyclomaticComplexity
end