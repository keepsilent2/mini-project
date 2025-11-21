require 'json'
require_relative 'task'

class Storage
  FILE_PATH = "tasks.json"

  def self.load
    return [] unless File.exist?(FILE_PATH)
    data = JSON.parse(File.read(FILE_PATH))
    data.map { |t| Task.new(t["id"], t["title"], t["description"], t["completed"]) }
  end

  def self.save(tasks)
    arr = tasks.map(&:to_h)
    File.write(FILE_PATH, JSON.pretty_generate(arr))
  end
end

