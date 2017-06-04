class Node

  # x: value of the node
  # l: left child node
  # r: right child node
  attr_accessor :x, :l, :r

  def initialize(x = nil, l = nil, r = nil)
    @x, @l, @r = x, l, r
  end

end


def create_tree(hash)
  return nil unless hash

  left = create_tree(hash[:l])
  right = create_tree(hash[:r])
  Node.new(hash[:x], left, right)
end

def count_turns(node, direction = nil, count = nil)
  return count unless node

  count = -1 if direction == nil

  left_count = count_turns(node.l,
                           :left,
                           direction == :left ? count : count + 1)
  right_count = count_turns(node.r,
                            :right,
                            direction == :right ? count : count + 1)

  left_count < right_count ? right_count : left_count
end


tree = { x: 0, l: { x: 100, l: {x: 101}}, r: { x: 200, l: {x: 110, l: {x: 112, l: {x: 113}, r: {x: 201, l: {x: 114}, r: {x:202}}}, r: {x: 203, l: {x: 115, l: {x: 116}, r: {x: 210}}, r: {x:204}}}, r:{x: 205}}}


require 'byebug'

binary_tree = create_tree(tree)
longest_turns = count_turns(binary_tree)

puts "Binary Tree: #{binary_tree}"

puts "Highest possible number of turns in a path: #{longest_turns}"

# byebug

puts __FILE__
