def solution(a)
  max = 0
  occurence = 0

  a.each_with_index do |item, index|
    max = item if item > max

    prev_item = index != 0 ? a[index - 1] : nil
    next_item = a[index + 1]
    if occurence?(prev: prev_item, next: next_item, max: max)
      occurence += 1
      puts item
    end

    return false if occurence > 1
  end

  return true
end

def occurence?(prev:, next:, max:)
  (next_item && next_item > item) &&
  (prev_item && prev_item > item)
end


# puts solution([1,2,50,3,40])
# puts solution([1, 5, 3, 3, 7])


def other_solution(a)
  b = a.sort
  a.zip(b).map{|i, j| i == j }.count(false) <= 2
end

puts other_solution([1,2,50,3,40])
puts other_solution([1, 5, 3, 3, 7])
