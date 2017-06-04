def flatten_array(array)
  flattened_array = []
  array.each do |item|
    if item.is_a? Array
      temp = flatten_array(item)
      flattened_array = flattened_array + temp
    else
      flattened_array << item
    end
  end

  flattened_array
end



input = [1, 2, [3], [4, [5, 6], 5, 6], [[7], [8, [9]]], 10]
output = [1, 2, 3, 4, 5, 6, 5, 6, 7, 8, 9, 10]
puts flatten_array(input) #== output

input = [1, 2, [3], [4, [5, 6], 5, 6], [[7], [8, [9]]], 10, [[[11], 12]]]
output =  [1, 2, 3, 4, 5, 6, 5, 6, 7, 8, 9, 10, 11, 12]
puts flatten_array(input) == output

input = [1, "a", "b", [ "c", ["d",2 ] ], "e", [ [ [ "f" ] ] ] ]
output =  [ 1, "a", "b", "c", "d", 2, "e", "f" ]
puts flatten_array(input) == output
