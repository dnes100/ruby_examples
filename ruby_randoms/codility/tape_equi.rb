def solution(a)
  result = nil
  a.each_with_index.map do |num, index|
    next if index == 0
    left = a.take(index).reduce(:+).to_i
    right = a.drop(index).reduce(:+).to_i
    difference = (left - right).abs

    if result
      result = difference if difference < result
    else
      result = difference
    end

  end
  result
end


def other_solution(a)
  sum = a.reduce(:+)
  puts "sum: #{sum}"
  temp = 0
  result = nil

  a.each_with_index do |num, index|
    temp += num
    puts "\nindex: #{index}  temp: #{temp}"

    # next if index == 0

    diff = (temp - (sum - temp)).abs

    if !result || ( diff < result)
      result = diff
    end
    puts "diff: #{diff}   result: #{result}"
  end

  result
end

p other_solution([-1000,1000])
