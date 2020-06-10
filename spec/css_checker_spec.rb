require_relative '../lib/load.rb'
require_relative '../lib/css_checker.rb'

describe CssChecker do
  let(:check) { Load.new }
  let(:bad_lines) { ['#head{', "padding: 10px; \n", '}'] }
  let(:good_lines) { ['#head {', '  padding: 10px;', '}', "\n"] }
  let(:no_new_lines) { ['#head {', '  justify-items: center; justify-content: center;', '}'] }
  let(:zero_px_lines) { ['.game {', 'padding: 0', 'margin: 0px;', '}'] }
  let(:errors) { [] }

  describe 'trailing_space_check' do
    it 'should return an empty array if there are no trailing spaces' do
      expect(check.trailing_space_check(good_lines, errors))
        .to eql([])
    end

    it 'should return an error message if trailing spaces are found' do
      expect(check.trailing_space_check(bad_lines, errors))
        .to eql(['Trailing space found on line 2.'])
    end
  end

  describe 'indentation_check' do
    it 'should return an empty array if there is an indentation of 2 spaces' do
      expect(check.indentation_check(good_lines, errors))
        .to eql([])
    end

    it 'should return an error message if there is no space before the opening bracket' do
      expect(check.indentation_check(bad_lines, errors))
        .to eql(['Indentation of 2 spaces expected. Found 0 spaces instead on line 2.'])
    end
  end

  describe 'last_line_check' do
    it 'should return nil if the last line is blank' do
      expect(check.last_line_check(good_lines, errors))
        .to eql(nil)
    end

    it 'should return an error message if the last line is not blank' do
      expect(check.last_line_check(bad_lines, errors))
        .to eql(['Last line in the file should be empty.'])
    end
  end

  describe 'new_line_check' do
    it 'should return nil if the syntax is okay' do
      expect(check.new_line_check(good_lines, errors))
        .to eql([])
    end

    it 'should return an error message if the syntax is not okay' do
      expect(check.new_line_check(no_new_lines, errors))
        .to eql(['Expected newline after semi-colon on line 2.'])
    end
  end

  describe 'zero_px_check' do
    it 'should return nil if the syntax is okay' do
      expect(check.zero_px_check(good_lines, errors))
        .to eql([])
    end

    it 'should return an error message if the syntax is not okay' do
      expect(check.zero_px_check(zero_px_lines, errors))
        .to eql(["Zero values don't need units on line 3."])
    end
  end
end
