require_relative 'task_service'

service = TaskService.new

loop do
  puts "\n=== TASK MANAGER ==="
  puts "1. Add Task"
  puts "2. List Task"
  puts "3. Search Task"
  puts "4. Toggle Complete"
  puts "5. Delete Task"
  puts "6. Exit"
  print "Choose: "
  menu = gets.chomp

  case menu
  when "1"
    print "Title: "; title = gets.chomp
    print "Description: "; desc = gets.chomp
    service.add(title, desc)
    puts "Task added."

  when "2"
    service.list.each do |t|
      status = t.completed ? "[✔]" : "[ ]"
      puts "#{t.id}. #{status} #{t.title} - #{t.description}"
    end

  when "3"
    print "Keyword: "; k = gets.chomp
    service.search(k).each do |t|
      puts "#{t.id}. #{t.title}"
    end

  when "4"
    print "ID: "; id = gets.chomp.to_i
    service.toggle(id)
    puts "Updated."

  when "5"
    print "ID: "; id = gets.chomp.to_i
    service.delete(id)
    puts "Deleted."

  when "6"
    break
  end
end

