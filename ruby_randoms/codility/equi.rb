require 'timeout'

def solution(a)
  Timeout::timeout(5) do

    a.each_with_index do |item, i|
      left = a[0...i]
      right = a[(i+1)...(a.length)]

      left_sum = left.reduce(:+) || 0
      right_sum = right.reduce(:+) || 0
      return i if  left_sum == right_sum
    end

    -1
  end
rescue Timeout::Error => e
  puts "time out #{e}"
  nil
end

puts " ---"
puts solution([-1,3,-4,5,1,-6,2,1])
puts solution []

puts solution [500, 1, -2, -1, 2]
puts solution [1, -1, -1, 1, 0] * 1_000_000_000
