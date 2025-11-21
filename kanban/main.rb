require_relative 'storage'
require_relative 'board'

data = Storage.load
board = Board.new(data)

loop do
  puts "\n=== KANBAN BOARD ==="
  board.columns.each do |k, v|
    puts "#{k.upcase}: #{v.join(', ')}"
  end

  puts "\n1. Add Task"
  puts "2. Move Task"
  puts "3. Exit"
  print "> "
  c = gets.chomp

  case c
  when "1"
    print "Title: "; t = gets.chomp
    board.add_task(t)
    Storage.save(board.columns)

  when "2"
    print "Task: "; t = gets.chomp
    print "From(todo/doing/done): "; f = gets.chomp
    print "To(todo/doing/done): "; to = gets.chomp
    board.move(t, f, to)
    Storage.save(board.columns)

  when "3"
    exit
  end
end

