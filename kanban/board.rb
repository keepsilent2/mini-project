class Board
  attr_accessor :columns

  def initialize(data)
    @columns = data
  end

  def add_task(title)
    @columns["todo"] << title
  end

  def move(task, from, to)
    return unless @columns[from].include?(task)
    @columns[from].delete(task)
    @columns[to] << task
  end
end

