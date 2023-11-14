require_relative 'lib/linked_list'

list = LinkedList.new
list.append(3)
list.append(4)
list.prepend(2)
list.prepend(1)

puts "Size: #{list.size}"
puts "Head: #{list.head}"
puts "Tail: #{list.tail}"
puts "Value at index #{2}: #{list.at(2)}"

list.pop

puts "Size: #{list.size}"
puts "Head: #{list.head}"
puts "Tail: #{list.tail}"
puts "Value at index #{2}: #{list.at(2)}"

puts "#{list.contains?(2)}"
puts "#{list.find(2)}"

list.to_s
list.insert_at(7, 1)

list.to_s
list.remove_at(2)

list.to_s