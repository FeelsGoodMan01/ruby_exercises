class Tree
  attr_accessor :root
  def initialize(array)
    @array = array.uniq.sort
    @root = self.build_tree(@array)
  end

  def draw
    node = @root
    while node.left_child || node.right_child
      self.pretty_print(node)
    end
  end


  def build_tree(array)
    if array.size == 2
      root_node = Node.new(array[0])
      root_node.right_child = Node.new(array[-1])
      return root_node
    end
    root_node = Node.new(array[array.size/ 2])
    return root_node if array.size == 1
    root_node.left_child = build_tree(array[0...array.size / 2])
    root_node.right_child = build_tree(array[(array.size / 2) + 1  .. -1])
    return root_node
  end


  def insert(data, node = @root)
    return if @array.include?(data)
    if data < node.data
      if node.left_child
        insert(data, node.left_child)
        return
      else
        node.left_child = Node.new(data)
        return
      end
    else
      if node.right_child
        insert(data, node.right_child)
        return
      else
        node.right_child = Node.new(data)
        return
      end
    end
  end


  def find(data, node = @root, delete = false)
    if delete
      if node.one_child
        return node if node.one_child.data == data
      end 
      if node.left_child.data == data || node.right_child.data == data
        return node
      else
        node = data < node.data ? find(data, node.left_child, true) : find(data, node.right_child, true)
        return node
      end
    end
    unless data == node.data
      node = data < node.data ? find(data, node.left_child) : find(data, node.right_child)
      return node
    end
    return node
  end

  def delete(data)
    parent_node = find(data, @root, delete = true)
    if parent_node.one_child
      node = parent_node.one_child
    else
      node = parent_node.left_child.data == data ? parent_node.left_child : parent_node.right_child
    end
    if node.one_child || !(node.has_child?)
      parent_node.right_child == node ? parent_node.right_child = node.one_child : parent_node.left_child = node.one_child
      return
    end
    p parent_node.data, node.data
  end
    
    


  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right_child, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_child
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left_child, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_child
  end

end

class Node
  include Comparable
  attr_accessor :data, :left_child, :right_child


  def initialize(data)
    @data = data
    @left_child = nil
    @right_child = nil
  end

  def <=>(other_node)
    self.data <=> other_node.data
  end

  def one_child
    if self.left_child && self.right_child
      return nil
    end
    self.left_child ? (return left_child) : (return right_child)
  end

  def has_child?
    if self.left_child || self.right_child
      return true
    else
      return false
    end
  end
end


array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

tree = Tree.new(array)

tree.pretty_print

tree.delete(324)

tree.delete(3)
tree.delete(7)

tree.pretty_print

