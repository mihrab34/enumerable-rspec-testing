module Enumerable
    def my_each
      return to_enum unless block_given?
  
      arr = to_a
  
      i = 0
      while i < size
        yield(arr[i])
        i += 1
      end
    end

    def my_each_with_index
      return to_enum unless block_given?
    
      arr = to_a
    
      i = 0
      while i < size
        yield(arr[i], i)
        i += 1
      end
    end
end