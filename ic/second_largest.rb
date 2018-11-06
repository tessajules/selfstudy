# https://www.interviewcake.com/question/ruby/second-largest-item-in-bst?section=dynamic-programming-recursion&course=fc1

# recursive solution
def second_largest_value_bst(node, top_values = []) # values = second_largest, largest
  top_values.push(node.value)
  sorted = top_values.sort
  top_values = sorted.length > 2 ? sorted[1..2] : sorted

  if node.children.empty?
    fail 'not deep enough' unless top_values.length == 2
    return top_values[0]
  end

  if node.right # prioritize going right since that's where bigger values are
    return second_largest_value(node.right, top_values)
  elsif node.left # if no right child, then forced to go left
    return second_largest_value(node.left, top_values)
  end
end

# iterative solution
def second_largest_value_bst(root)
  nodes = [root]

  top_values = []
  while !nodes.empty?
    node = nodes.pop

    top_values.push(node.value)
    sorted = top_values.sort
    top_values = sorted.length > 2 ? sorted[1..2] : sorted

    if node.right # prioritize going right since that's where bigger values are
      nodes << node.right
    elsif node.left  # if no right child, then forced to go left
      nodes << node.left
    end
  end

  fail 'not deep enough' unless top_values.length == 2
  top_values[0]
end

# largest recursive
def largest_value_bst(node)
  return node.value unless node.right
  largest_value_bst(node.right)
end

# solution from ic
def second_largest_value_bst(node)
  if node.right
    return node.value if node.right.children.empty?
    return second_largest_value_bst(node.right)
  elsif node.left
    return largest_value_bst(node.left)
  else
    fail 'not deep enough'
  end

end

class BinaryTree
  def initialize(value = 0)
    @value = value
    @left = nil
    @right = nil
  end

  def left
    @left
  end

  def right
    @right
  end

  def value
    @value
  end

  def insert_left(value)
    @left = BinaryTree.new(value)
  end

  def insert_right(value)
    @right = BinaryTree.new(value)
  end

  def children
    [@left, @right].compact
  end
end

root = BinaryTree.new(6)
l = root.insert_left(4)
ll = l.insert_left(3)
lr = l.insert_right(5)
p second_largest_value_bst(root) # should be 5
# p largest_value_bst(root) # should be 6

r = root.insert_right(8)
rl = r.insert_left(7)
rr = r.insert_right(9)
p second_largest_value_bst(root) # should be 8
# p largest_value_bst(root) # should be 9
