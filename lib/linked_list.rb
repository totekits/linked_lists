require_relative 'node'

class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    node = Node.new(value)
    if @head.nil? && @tail.nil?
      @head = node
      @tail = node
    else
      @tail.next_node = node
      @tail = node
    end
  end

  def prepend(value)
    node = Node.new(value)
    node.next_node = @head
    @head = node
  end

  def size
    count = 0
    current_node = @head
    until current_node.nil?
      count += 1
      current_node = current_node.next_node
    end
    count
  end

  def head
    @head.value if @head
  end

  def tail
    @tail.value if @tail
  end

  def at(index)
    current_node = @head
    index.times do
      current_node = current_node.next_node
    end
    current_node.value
  end

  def pop 
    return if @head.nil?

    if @head == @tail
      @head = nil
      @tail = nil
      return
    end

    current_node = @head
    until current_node.next_node == @tail 
      current_node = current_node.next_node
    end

    current_node.next_node = nil
    @tail = current_node 
  end

  def contains?(value)
    current_node = @head
    until current_node.nil?
      if current_node.value == value
        return true
      else
        current_node = current_node.next_node
      end
    end
    return false
  end

  def find(value)
    current_node = @head
    index = 0
    until current_node.nil?
      if current_node.value == value 
        return index
      else
        index += 1
        current_node = current_node.next_node
      end
    end
    return nil
  end

  def to_s
    if @head.nil?
      puts "nil"
    elsif @head == @tail
      puts "( #{@head.value} ) -> nil"
    else
      string = ""
      current_node = @head
      until current_node.nil?
        substring = "( #{current_node.value} ) -> "
        string << substring
        current_node = current_node.next_node
      end
      string << "nil"
      puts string
    end
  end

  def insert_at(value, index)
    current_node = @head 
    if @head.nil?
      prepend(value)
    else 
      node = Node.new(value)
      position = 0
      until position == index || current_node.nil?
        current_node = current_node.next_node
        position += 1
      end

      if position == index
        node.next_node = current_node.next_node
        current_node.next_node = node
      else
        puts "Index out of bounds."
      end
    end
  end

  def remove_at(index)
    current_node = @head
    if @head.nil?
      return
    else
      if index == 0
        @head = @head.next_node
      else
        position = 0
        until position == index - 1 || current_node.nil? || current_node.next_node.nil?
          current_node = current_node.next_node
          position += 1
        end

        if current_node.next_node.nil?
          puts "Index out of bounds."
          return
        end
        
        current_node.next_node = current_node.next_node.next_node
      end
    end
  end
end