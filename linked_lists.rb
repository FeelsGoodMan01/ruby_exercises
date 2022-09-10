class LinkedList
  attr_reader :head, :tail
  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    unless @head
      @head = Node.new(value)
      @tail = @head
      return
    end
    @tail.link = Node.new(value)
    @tail = @tail.link
    return
  end

  def prepend(value)
    @head = Node.new(value, @head)
  end

  def size
    unless @head
      return 0
    end
    node = @head
    count = 1
    while node.link
      count += 1
      node = node.link
    end
    count
  end

  def at(index)
    return @head if index == 0
    node = @head.link
    count = 1
    while index != count
      node = node.link
      count += 1
    end
    return node
  end

  def pop
    return puts "Can't pop from empty list" unless @head
    return @head = nil unless @head.link
    node = @head
    while node.link.link
      node = node.link
    end
    @tail = node
    @tail.link = nil
  end


  def contains?(value)
    return false unless @head
    node = @head
    while node.link
      return true if node.value == value
      node = node.link
    end
    return node.value == value
  end

  def find(value)
    return nil unless @head
    node = @head
    count = 0
    while node.link
      return count if node.value == value
      node = node.link
      count += 1
    end
    return count if node.value == value
    return nil
  end

  def insert_at(value, index)
    return prepend(value) if index == 0
    node = @head
    count = 1
    while count < index
      count += 1
      node = node.link
    end
    node.link = Node.new(value, node.link)
  end

  def remove_at(index)
    return @head = @head.link if index == 0
    node = @head
    count = 1
    while count < index
      count += 1
      node = node.link
    end
    node.link = node.link.link
  end 

  def to_s
    return puts "Empty" unless @head
    @head.to_s
    return ""
  end
end


class Node
  attr_accessor :link, :value
  def initialize(value = nil, link = nil)
    @value = value
    @link = link
  end

  def to_s
    print "( #{value} )  "
    if link
      print "->  "
      link.to_s
      return
    end
    puts
  end

end


test = LinkedList.new 
test.append('test1')
test.append('test2')
test.append('test3')
p test.tail
test.prepend('test4')
p test.size
puts test.contains?('test5')
puts test.contains?('test3')
p test.find('test2')
p test.find('test5')
test.pop
test.append('post-pop')
test.prepend('prepend-test')
test.append('append-test')
puts test
p test.at(5)
puts test
test.insert_at('insert_test', 1)
puts test
test.insert_at('insert_head_test', 0)
puts test
test.remove_at(1)
puts test
test.remove_at(0)
puts test