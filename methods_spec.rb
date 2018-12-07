require('rspec')
require('pry')
require('methods.rb')

describe('String') do
  describe('String#string_length') do
    it("returns the number of characters/spaces in a string") do
      expect("hello".string_length()).to(eq(5))
    end
  end
end
