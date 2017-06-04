
names = ['iterm 1', 'shell 1', 'iterm 10', 'iterm 2', 'iterm 3', 'iterm 12', 'shell 2', 'shell 10', 'dinesh 1', 'zzz 100']

puts names.inspect
puts names.sort.inspect

names = names.sort do |a, b|
  x = a.split(' ')
  y = b.split(' ')

  result = (x.first <=> y.first)
  result =  x.last.to_i <=> y.last.to_i if result.zero?

  puts x.inspect + '   ' + y.inspect + ' ' + (x.first <=> y.first).to_s + ' ' + (x.last.to_i <=> y.last.to_i).to_s + ' ' + result.to_s
  result
end

puts names.inspect
