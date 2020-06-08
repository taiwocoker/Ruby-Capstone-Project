# frozen_string_literal: true

require_relative '../lib/load.rb'
require_relative '../lib/check_space.rb'

describe CheckSpace do
  let(:check) { Load.new }
  let(:good_lines) { ['#head {', '  padding: 10px;', '}', "\n"] }
  let(:bad_lines) { ['#head{', "padding: 10px;background-image: linear-gradient(to top,#838383 ,#54575a,#8a8a8a; \n",'}'] }
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

  describe 'space_after_comma_check' do
    it 'should return an empty array if a single space after comma is not found' do
      expect(check.space_after_comma_check(good_lines, errors))
        .to eql([])
    end

    it 'should return an error message if there is no single space after the comma' do
      expect(check.space_after_comma_check(bad_lines, errors))
        .to eql(['There should be a space after the comma on line 2'])
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

  describe 'unexpected_white_space_check' do
    it 'should return an empty array if there are no spaces before the comma' do
      expect(check.unexpected_white_space_check(good_lines, errors))
        .to eql([])
    end

    it 'should return an error message if spaces are found' do
      expect(check.unexpected_white_space_check(bad_lines, errors))
        .to eql(['Trailing space found on line 2.'])
    end
  end


  

end
