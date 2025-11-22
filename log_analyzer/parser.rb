class LogParser
  def initialize(file)
    @file = file
  end

  def parse
    logs = []
    File.readlines(@file).each do |line|
      if line =~ /\[(INFO|WARN|ERROR)\] (.+)/
        logs << { level: $1, message: $2 }
      end
    end
    logs
  end
end

