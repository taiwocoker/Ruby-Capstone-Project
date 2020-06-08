# frozen_string_literal: true

module CheckSpace # rubocop:todo Style/Documentation
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

  def unexpected_white_space_check(lines, errors)
    lines.each_with_index do |line, index|
      next unless line.include?(',')

      errors << "Unexpected whitespace before comma on line #{index + 1}" unless line =~ /\,[[:space:]]/
    end
    errors
  end

  def indentation_check(lines, errors)
    lines.each_with_index do |line, index|
      next if line.start_with?('@') || line == "\n" || line.end_with?(",\n")
      next if ['{', '}'].any? { |needle| line.include? needle }

      num_of_spaces = line[/\A */].size
      if num_of_spaces < 2 || num_of_spaces > 2
        errors << "Indentation of 2 spaces expected.
              Found #{num_of_spaces} spaces instead on line #{index + 1}."
      end
    end
    errors
  end

  def new_line_check(lines, errors)
    lines.each_with_index do |line, index|
      errors << "Expected newline after semi-colon on line #{index + 1}." if line.end_with?("; \n")
    end
    errors
  end

  def zero_px_check(lines, errors)
    lines.each_with_index do |line, index|
      errors << "Zero values don't need units on line #{index + 1}." if line =~ /[\s](0px)/
    end
    errors
  end

  # rubocop:enable Metrics/CyclomaticComplexity
end
