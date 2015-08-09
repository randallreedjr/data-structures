class Stack
  attr_reader :length, :head
  Node = Struct.new(:data, :next)

  def initialize
    @length = 0
    @head = nil
  end

  def peek
    head.data if head
  end

  def pop
    if head
      @length -= 1
      previous = head
      @head = head.next
      previous.data
    end
  end

  def push(element)
    @length += 1
    node = Node.new(element, head)
    @head = node
  end

  private
end