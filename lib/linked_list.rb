require './lib/node'

class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(data)
    if @head.nil?
      @head = Node.new(data, self)
      data
    else
      @head.append(data)
    end
  end

  def prepend(data)
    @head = Node.new(data, nil, @head)
    data
  end

  def insert(index, data)
    if index == 0
      @head = Node.new(data, self)
      data
    elsif @head.nil?
      nil
    else
      @head.insert(index, data, 1)
    end
  end

  def count
    if @head.nil?
      0
    else
      @head.count(1)
    end
  end

  def to_s
    if @head.nil?
      nil
    else
      @head.to_s("")
    end
  end

end