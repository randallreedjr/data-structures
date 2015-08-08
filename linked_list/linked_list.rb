class LinkedList
  attr_reader :length, :head
  Node = Struct.new(:data, :next)

  def initialize
    @head = nil
    @length = 0
    
  end

  def push(data)
    node = Node.new(data, nil)
    if head.nil?
      @head = node
    else
      tail = find_tail.first
      tail.next = node
    end
    @length += 1
  end

  def pop
    if head.nil?
      return nil
    else
      @length -= 1
      previous = head
      @head = head.next
      return previous.data
    end
  end

  def peek
    head.nil? ? nil : head.data
  end

  def each
    current = head
    while current
      yield current.data
      current = current.next
    end
    return self
  end

  private 
  def find_tail
    previous = nil
    current = head
    while current && current.next
      previous = current
      current = current.next
    end
    return [current, previous]
  end
end