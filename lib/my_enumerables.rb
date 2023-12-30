# bundle exec rspec <spec_file>

module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for item in self do
      yield item
    end
  end

  def my_all?
    for element in self
      return false unless yield(element)
    end
    true
  end

  def my_any?
    my_each do |element|
      return true if yield(element)
    end
    false
  end

  def my_count
    i = 0
    if block_given?
      for element in self
        i += 1 if yield(element)
      end
    else
      for element in self
        i += 1
      end
    end    
    return i
  end

  def my_each_with_index
    i = 0
    for item in self do
      yield item, i 
      i += 1
    end
  end

  def my_inject(initial = nil)
    result = initial.nil? ? first : initial
    each_with_index do |item, index|
      next if index.zero? && initial.nil?

      result = yield(result, item)
    end
    result
  end

  def my_map
    result = []
    for item in self do
      result << yield(item)
    end
    result
  end

  def my_none?
    for element in self
      return false if yield(element)
    end
    true
  end

  def my_select(&block)
    result = []
    my_each do |item|
      result << item if block.call(item)
    end
    result
  end


end

