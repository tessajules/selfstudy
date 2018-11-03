# https://www.interviewcake.com/question/ruby/balanced-binary-tree?course=fc1&section=trees-graphs

def max_min(node, val = 0)
  if node.children.empty?
    return val, val
  end

  left_max, right_max, left_min, right_min = nil

  if node.left
    left_max, left_min = depths(node.left, val + 1)
  end

  if node.right
    right_max, right_min = depths(node.right, val + 1)
  end

  max = [left_max || right_max, right_max || left_max].max
  min = [left_min || right_min, right_min || left_min].min
  p "max #{max} min #{min}"
  [max, min]
end

def get_depths(node, depths = [])
  if node.children.empty?
    depths << node.value
    return depths
  end

  new_depths = []
  node.children.each do |child|
    get_depths(child, depths).each do |d|
      new_depths << d
    end
  end

  new_depths
end

def superbalanced?(node)
  depths = get_depths(node)
  depths.max - depths.min <= 1
end


def get_depths(node, depths = [])
  if node.children.empty?
    depths << node.value
    return depths
  end

  new_depths = []
  node.children.each do |child|
    get_depths(child, depths).each do |d|
      new_depths << d
    end
  end

  new_depths
end

require "set"

def superbalanced?(node, depths = Set.new)
  if node.children.empty?
    depths.add(node.value)
    return [depths, true]
  end

  node.children.each do |child|
    child_depths, is_sb = superbalanced?(child, depths)
    child_depths.each do |d|
      depths.add(d)
      return depths, false if depths.length > 2
    end
  end

  return depths, true
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

  def insert_left
    @left = BinaryTree.new(@value + 1)
  end

  def insert_right
    @right = BinaryTree.new(@value + 1)
  end

  def children
    [@left, @right].compact
  end
end

root = BinaryTree.new
l = root.insert_left
r = root.insert_right
p superbalanced?(root)
ll = l.insert_left
lr = l.insert_right
p superbalanced?(root)
lll = ll.insert_left
llr = l.insert_right
p superbalanced?(root)
llll = lll.insert_left
p superbalanced?(root)
