# frozen_string_literal: true

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
    i = 0
    current = @head
    while i < index
      current = current.next_node
      i += 1
    end
    current
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
      return true if current.value == value

      current = current.next_node
    end
    false
  end

  def find(value)
    i = 0
    current = @head
    until current.nil?
      return i if current.value == value

      i += 1
      current = current.next_node
    end
    'not found'
  end

  def to_s
    current = @head
    values = []

    until current.nil?
      values << current.value
      current = current.next_node
    end

    values << current
    values.map { |x| x.nil? ? 'nil' : "( #{x} )" }.join(' -> ')
  end

  def insert_at(value, index)
    i = 0
    current = @head
    while i < index - 1
      return "list not long enough: index #{i}" if current.nil?

      i += 1
      current = current.next_node
    end

    new_node = Node.new value
    new_node.next_node = current.next_node
    current.next_node = new_node
  end

  def remove_at(index)
    i = 0
    current = @head

    while i < index - 1
      return "list not long enough: index #{i}" if current.nil?

      i += 1
      current = current.next_node
    end
    current.next_node = current.next_node.next_node
  end
end

# comment
class Node
  attr_accessor :value, :next_node

  def initialize(value)
    @value = value
    @next_node = nil
  end
end

ll = LinkedList.new
ll.append 2
ll.append 5
ll.append 6
ll.prepend 'hello'
ll.prepend 'first'

p ll
p "size: #{ll.size}"
p "node at index 3: #{ll.at(3)}"

p "popped node: #{ll.pop.inspect}"
p ll

p "contains 5: #{ll.contains? 5}"
p "contains zero: #{ll.contains? 'zero'}"

p "find first: #{ll.find 'first'}"
p "find 5: #{ll.find 5}"
p "find 3: #{ll.find 3}"

ll.insert_at('on index 2', 2)
p ll.insert_at('on index 99', 9)

p ll.to_s

ll.remove_at(3)
p ll.to_s
