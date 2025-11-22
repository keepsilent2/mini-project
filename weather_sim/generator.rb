class WeatherGenerator
  CONDITIONS = ["Sunny", "Rain", "Cloudy", "Storm", "Windy"]

  def self.random_day
    {
      temp: rand(18..34),
      humidity: rand(30..90),
      condition: CONDITIONS.sample
    }
  end

  def self.week
    (1..7).map { random_day }
  end
end

