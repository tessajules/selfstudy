# https://www.interviewcake.com/question/ruby/bst-checker?course=fc1&section=trees-graphs

def binary_search_tree?(root)
  root.upper_bound = Float::INFINITY
  root.lower_bound = -Float::INFINITY

  node_stack = [[root, upper_bound, lower_bound]] # DFS so stack

  while !node_stack.empty?
    node, upper_bound, lower_bound = node_stack.pop
    return false unless node.value < upper_bound && node.value > lower_bound

    if node.left
      node_stack << [node.left, node.value, node.lower_bound]
    end

    if node.right
      node_stack << [node.right, upper_bound, node.value]
    end
  end

  true
end

def binary_search_tree?(node, upper_bound = Float::INFINITY, lower_bound = -Float::INFINITY)
  if node.children.empty?
    return node.value < upper_bound && node.value > lower_bound
  end

  if node.left
    return false unless binary_search_tree?(node.left, node.value, lower_bound)
  end

  if node.right
    return false unless binary_search_tree?(node.right,  upper_bound, node.value)
  end

  true
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

r = root.insert_right(8)
rl = r.insert_left(7)
rr = r.insert_right(9)

p binary_search_tree?(root) # should be true

lll = ll.insert_left(2)
llr = ll.insert_right(6)
p binary_search_tree?(root) # should be false
