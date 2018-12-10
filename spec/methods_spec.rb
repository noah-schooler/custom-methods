require('rspec')
require('pry')
require('methods')

describe('String#string_length') do
  it("returns the number of characters/spaces in a string") do
    expect("hello".string_length).to(eq(5))
  end
end

describe('String#string_reverse') do
  it("reverses a string") do
    expect("Another happy landing".string_reverse).to(eq("gnidnal yppah rehtonA"))
  end
end

describe('String#string_index') do
  it("returns the character at the inputted index") do
    expect("And what a lovely morning...".string_index(-1)).to(eq("."))
    expect("And what a lovely morning...".string_index(3)).to(eq(" "))
  end
end

describe('String#string_concat!') do
  it("concatenates two strings together") do
    expect("hello".string_concat!(" world!")).to(eq("hello world!"))
  end
end

describe('Fixnum#to_string') do
  it("returns the receiver as a string") do
    expect(1.to_string).to(eq("1"))
  end
end

describe('Array#array_join') do
  it("joins the elements of an array in a single string") do
    expect(['a', 'b', 'c'].array_join).to(eq("abc"))
    expect([1, [2, 3, [4, 5, [6, 7, 8]]]].array_join(" ")).to(eq("1 2 3 4 5 6 7 8"))
    expect([:symbol, ["a", "b", [1, 2], "c"], "string 'substring'", 2456].array_join(" ")).to(eq("symbol a b 1 2 c string 'substring' 2456"))
  end
end

describe('Array#array_length') do
  it("returns the number of elements in an array") do
    expect([1, [2, 3], 'a', 'b'].array_length).to(eq(4))
  end
end

describe('Array#increment_nums!') do
  it("adds 1 to every element of an array that is a Fixnum") do
    expect([17, [2, 3], 'a', 'b', 5].increment_nums!).to(eq([18, [2, 3], 'a', 'b', 6]))
  end
end

describe('Array#array_pop') do
  it("returns a designated number of elements from the end of an array") do
    expect([1,2,3,4,5].array_pop(3)).to(eq([3,4,5]))
    expect(['a','b','c','d','e'].array_pop()).to(eq('e'))
    expect(['a','b','c'].array_pop(4)).to(eq(['a','b','c']))
    expect([].array_pop()).to(eq(nil))
  end
end
