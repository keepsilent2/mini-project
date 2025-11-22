require_relative "organizer"

print "Folder path: "
path = gets.chomp

org = Organizer.new(path)
org.organize

puts "Organized!"

