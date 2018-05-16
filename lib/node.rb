class Node
  attr_reader :data, :previous_node, :next_node

  def initialize(data, previous_node, next_node = nil)
    @data = data
    @previous_node = previous_node
    @next_node = next_node
  end

  def append(data)
    if @next_node.nil?
      if @previous_node.head
        @next_node = Node.new(data, @previous_node.head)
        data
      else
        @next_node = Node.new(data, self)
        data
      end
    else
      @next_node.append(data)
    end
  end

  def insert(index, data, node_index)
    if index == node_index
      Node.new(data, @previous_node, self)
      data
    elsif @next_node.nil?
      nil
    else
      @next_node.insert(index, data, node_index += 1)
    end
  end

  def count(current_count)
    if @next_node.nil?
      current_count
    else
      @next_node.count(current_count += 1)
    end
  end

  def to_s(node_string)
    node_string = node_string + @data.to_s
    if @next_node.nil?
      node_string
    else
      @next_node.to_s(node_string)
    end
  end
end