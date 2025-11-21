require_relative 'task'
require_relative 'storage'

class TaskService
  def initialize
    @tasks = Storage.load
  end

  def add(title, description)
    id = (@tasks.map(&:id).max || 0) + 1
    task = Task.new(id, title, description)
    @tasks << task
    Storage.save(@tasks)
  end

  def list
    @tasks
  end

  def find(id)
    @tasks.find { |t| t.id == id }
  end

  def search(keyword)
    @tasks.select { |t| t.title.include?(keyword) }
  end

  def toggle(id)
    task = find(id)
    return unless task
    task.completed = !task.completed
    Storage.save(@tasks)
  end

  def delete(id)
    @tasks.reject! { |t| t.id == id }
    Storage.save(@tasks)
  end
end

