class Report
  def self.print(week)
    puts "\n=== WEEKLY WEATHER REPORT ==="
    week.each_with_index do |d, i|
      puts "Day #{i+1}: #{d[:temp]}°C | #{d[:humidity]}% | #{d[:condition]}"
    end
  end
end

