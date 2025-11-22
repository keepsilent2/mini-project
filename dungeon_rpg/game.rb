require_relative "player"
require_relative "enemy"

class Game
  MAP = [
    "Start", "Empty", "Enemy", "Treasure", "Enemy", "Boss"
  ]

  def initialize(player)
    @player = player
    @pos = 0
  end

  def play
    loop do
      tile = MAP[@pos]
      puts "\nYou are at: #{tile}"

      case tile
      when "Enemy"
        battle(Enemy.new("Goblin"))
      when "Boss"
        battle(Enemy.new("Dragon"))
        puts "YOU WIN!"
        exit
      when "Treasure"
        @player.inventory << "Potion"
        puts "You found a potion!"
      end

      @pos += 1
      exit if @pos >= MAP.size
    end
  end

  def battle(enemy)
    puts "\nBattle vs #{enemy.name}"

    loop do
      enemy.hp -= @player.attack
      puts "You hit #{enemy.name}, HP: #{enemy.hp}"
      break if enemy.hp <= 0

      @player.hp -= enemy.attack
      puts "#{enemy.name} hit you, HP: #{@player.hp}"
      break if @player.hp <= 0
    end

    if @player.hp <= 0
      puts "You died!"
      exit
    else
      puts "Enemy defeated!"
    end
  end
end

