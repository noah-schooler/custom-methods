class String
  def string_length()
    characters = self.split("")
    counter = 0
    characters.each do |character|
      counter += 1
    end
    counter
  end

  def string_reverse()
    characters = self.split("")
    i = self.length() - 1
    reversed_characters = []
    self.length().times() do
      reversed_characters.push(characters[i])
      i -= 1
    end
    reversed_characters.join
  end

  def string_index(index)
    characters = self.split("")
    reverse_characters = characters.reverse()
    counter = 0
    if (index >= 0) && (index < self.length())
      characters.each do |character|
        if counter == index
          return character
        end
        counter += 1
      end
    elsif (index < 0) && (index >= self.length() - (self.length() + self.length()))
      reverse_characters.each do |character|
        if counter - 1 == index
          return character
        end
        counter -= 1
      end
    else
      nil
    end
  end

  def string_concat(string)
    index = self.length
    letters = string.split("")
    letters.each do |letter|
      self[index] = letter
      index += 1
    end
    self
  end
end

class Fixnum
  # Is there a way to get this to work without string interpolation?
  def to_string()
    "#{self}"
  end
end

class Array
  def array_join(sep="")
    joined_array = ""
    length = self.length
    counter = 1
    self.each do |element|
      if element.class() == Array
        joined_array.concat(sub_array_join(sep, length, counter, element))
        counter += 1
      else
        if counter == length
          joined_array.concat(element.to_s)
        else
          joined_array.concat(element.to_s + sep)
          counter += 1
        end
      end
    end
    joined_array
  end

  def sub_array_join(sep, length, counter, array)
    joined_array = ""
    index = 1
    if counter == length
      array.each do |element|
        if element.class() == Array
          joined_array.concat(sub_array_join(sep, length, counter, element))
        else
          if index == array.length
            joined_array.concat(element.to_s)
          else
            index += 1
            joined_array.concat(element.to_s + sep)
          end
        end
      end
    else
      array.each do |element|
        if element.class() == Array
          joined_array.concat(sub_array_join(sep, length, counter, element))
        else
          joined_array.concat(element.to_s + sep)
        end
      end
    end
    joined_array
  end

  def array_length()
    counter = 0
    self.each do |element|
      counter += 1
    end
    counter
  end

  # Example of a custom bang method (permanently changes [designated values of] the receiver [but not the object id])
  def increment_nums!()
    i = 0
    self.each do |element|
      if element.class() == Fixnum
        self[i] = self[i] + 1
        i += 1
      else
        i += 1
      end
    end
  end

  # Currently pops and takes arguments correctly, but does not modify the receiver
  def array_pop(num=1)
    i = self.length - 1
    pop_array = []
    if num >= self.length
      self.length.times do
        pop_array.push(self[i])
        i -= 1
      end
    else
      num.times do
        pop_array.push(self[i])
        i -= 1
      end
    end
    if self == []
      nil
    elsif pop_array.length == 1
      pop_array[0]
    else
      pop_array.reverse()
    end
  end
end
