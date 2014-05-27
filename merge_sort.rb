module MergeSort

  def self.sort(input)
    if input.length >= 2
      left, right = split(input)
      if left.length > 1
        left = self.sort(left) 
        right = self.sort(right) 
      end    
      merge(left,right)
    end
  end

  private

  def self.split(input)
    len = input.length
    return input, nil if len < 2 
    split_index = (len / 2) - 1
    return input[0..split_index], input[split_index + 1 .. len -1]
  end

  def self.merge(left, right)
    merged = []
    while ( left.length > 0 && right.length > 0 )
      if left[0] < right[0]
        merged << left.shift
      else
        merged << right.shift
      end
    end
    #add the leftovers (if any)
    merged.concat(left).concat(right)
  end

end


