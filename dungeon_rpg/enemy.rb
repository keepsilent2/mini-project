class Enemy
  attr_accessor :hp, :name

  def initialize(name)
    @name = name
    @hp = rand(30..60)
  end

  def attack
    rand(5..15)
  end
end

