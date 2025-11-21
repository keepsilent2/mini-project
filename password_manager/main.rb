print "Master password: "
master = STDIN.noecho(&:gets).chomp
puts

manager = Manager.new(master)

loop do
  puts "\n=== PASSWORD MANAGER ==="
  puts "1. Add password"
  puts "2. List services"
  puts "3. Get password"
  puts "4. Delete"
  puts "5. Exit"
  print "> "
  c = gets.chomp

  case c
  when "1"
    print "Service: "; s = gets.chomp
    print "Password: "; p = gets.chomp
    manager.add(s, p)

  when "2"
    puts manager.list

  when "3"
    print "Service: "; s = gets.chomp
    puts "Password: #{manager.get(s)}"

  when "4"
    print "Service: "; s = gets.chomp
    manager.delete(s)

  when "5"
    exit
  end
end

