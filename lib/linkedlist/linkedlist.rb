# frozen_string_literal: true

require_relative 'node'

# comment
class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new value

    @head.nil? ? @head = new_node : @tail.next_node = new_node
    @tail = new_node
  end

  def prepend(value)
    new_node = Node.new value
    if @head.nil?
      @head = new_node
    else
      tmp = @head
      @head = new_node
      @head.next_node = tmp
    end
  end

  def size
    return 0 if @head.nil?

    i = 1
    current = @head
    until current.next_node.nil?
      i += 1
      current = current.next_node
    end
    i
  end
  # head -- use getter
  # tail -- use getter

  def at(index)
    current = @head
    while index.positive?
      current = current.next_node
      index -= 1
    end
    current
  end

  def shift
    @head = head.next_node
  end

  def pop
    current = @head
    current = current.next_node until current.next_node.next_node.nil?
    deleted = current.next_node
    current.next_node = nil
    @tail = current
    deleted
  end

  def contains?(value)
    current = @head
    until current.nil?
      return true if current.data == value

      current = current.next_node
    end
    false
  end

  def find(value)
    i = 0
    current = @head
    until current.nil?
      return i if current.data == value

      i += 1
      current = current.next_node
    end
    nil
  end

  def to_s
    current = @head
    values = []

    until current.nil?
      values << current.data
      current = current.next_node
    end

    values << current
    values.map { |x| x.nil? ? 'nil' : "( #{x} )" }.join(' -> ')
  end

  def insert_at(value, index)
    return "index too large. size: #{size}" if index >= size

    new_node = Node.new value

    before = at index - 1
    new_node.next_node = at index

    before.next_node = new_node
  end

  def remove_at(index)
    return "index too large. size: #{size}" if index >= size
    return shift if index.zero?
    return pop if index == size - 1

    before = at(index - 1)
    current = at(index)

    before.next_node = current.next_node
  end
end

# TEST
# ll = LinkedList.new
# ll.append 2
# ll.append 5
# ll.append 6
# ll.prepend 'hello'
# ll.prepend 'first'

# p ll
# p "size: #{ll.size}"
# p "node at index 3: #{ll.at(3).inspect}"

# p "popped node: #{ll.pop.inspect}"
# p ll

# p "contains 5: #{ll.contains? 5}"
# p "contains zero: #{ll.contains? 'zero'}"

# p "find first: #{ll.find 'first'}"
# p "find 5: #{ll.find 5}"
# p "find 3: #{ll.find 3}"

# ll.insert_at('on index 2', 2)
# p ll.insert_at('on index 99', 9)

# p ll.to_s

# ll.remove_at(1)
# p ll.to_s

# ll.remove_at(0)
# p ll.to_s
