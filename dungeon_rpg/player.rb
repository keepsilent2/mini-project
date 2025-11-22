class Player
  attr_accessor :hp, :inventory, :name

  def initialize(name)
    @name = name
    @hp = 100
    @inventory = []
  end

  def attack
    rand(10..20)
  end
end

