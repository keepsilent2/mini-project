require_relative "bot"

bot = Bot.new

loop do
  print "You: "
  msg = gets.chomp
  puts "Bot: #{bot.respond(msg)}"
end

