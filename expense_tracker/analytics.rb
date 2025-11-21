class Analytics
  def self.by_category(expenses)
    totals = Hash.new(0)
    expenses.each { |e| totals[e.category] += e.amount }
    totals
  end

  def self.chart(hash)
    puts "\n=== ASCII EXPENSE CHART ==="
    hash.each do |cat, val|
      bar = "#" * (val / 5).to_i
      puts "#{cat.ljust(10)} | #{bar} #{val.round(2)}"
    end
  end
end

