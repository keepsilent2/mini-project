require 'yaml'

class Storage
  FILE = "board.yml"

  def self.load
    unless File.exist?(FILE)
      return {"todo" => [], "doing" => [], "done" => []}
    end
    YAML.load_file(FILE)
  end

  def self.save(data)
    File.write(FILE, data.to_yaml)
  end
end

