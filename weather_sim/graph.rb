class Graph
  def self.line(data, key)
    max = data.map { |d| d[key] }.max
    data.each do |d|
      bar = "*" * (d[key] * 50 / max)
      puts "Day #{d[:day]} | #{bar} (#{d[key]})"
    end
  end
end

