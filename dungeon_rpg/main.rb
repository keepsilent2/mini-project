require_relative "game"

print "Name: "
name = gets.chomp
p = Player.new(name)

game = Game.new(p)
game.play

