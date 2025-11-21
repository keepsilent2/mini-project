require_relative 'tracker'
require_relative 'analytics'

tracker = Tracker.new

loop do
  puts "\n=== EXPENSE TRACKER ==="
  puts "1. Add Expense"
  puts "2. List"
  puts "3. Analytics"
  puts "4. Exit"
  print "> "

  choice = gets.chomp

  case choice
  when "1"
    print "Amount: "; amt = gets.chomp
    print "Category: "; cat = gets.chomp
    print "Note: "; note = gets.chomp
    tracker.add(amt, cat, note)

  when "2"
    tracker.list.each do |e|
      puts "#{e.id}. #{e.amount} | #{e.category} | #{e.note}"
    end

  when "3"
    data = Analytics.by_category(tracker.list)
    Analytics.chart(data)

  when "4"
    exit
  end
end

