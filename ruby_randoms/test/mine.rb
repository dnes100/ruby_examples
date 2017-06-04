def show_number_of_mines(input)

  parsed_array = input.strip.split("\n").map do |row|
    row.strip.split(' ')
  end


  parsed_array.each_with_index do |row, x|
    row.each_with_index do |item, y|
      if item == 'X'
        print item
      else
        print count_mines(x, y, parsed_array)
      end
      print ' '
    end
    print "\n"
  end

end


def count_mines(x, y, array)
  count = 0
  x_range = (x == 0 ? 0 : x-1)..(x == array.first.length - 1 ? x : x+1)
  y_range = (y == 0 ? 0 : y-1)..(y == array.length - 1 ? y: y+1)
  # require 'byebug';byebug
  x_range.each do |i|
    y_range.each do |j|
      next if i == x && j == y

      count += 1 if array[i][j] == 'X'

    end
  end

  count
end




input = " X O X \n O X O \n O O X "

show_number_of_mines(input)
