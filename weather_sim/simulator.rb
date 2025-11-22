class WeatherSimulator
  def initialize(days)
    @days = days
  end

  def generate
    (1..@days).map do |d|
      temp = rand(20..35)
      humidity = rand(40..90)
      { day: d, temp: temp, humidity: humidity }
    end
  end
end

