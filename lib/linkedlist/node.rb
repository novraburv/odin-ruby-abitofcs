# frozen_string_literal: true

# comment
class Node
  attr_accessor :data, :next_node

  def initialize(value)
    @data = value
    @next_node = nil
  end
end
