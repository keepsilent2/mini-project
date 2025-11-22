class Report
  def self.summary(logs)
    count = Hash.new(0)
    logs.each { |l| count[l[:level]] += 1 }
    count
  end

  def self.display(count)
    count.each do |k, v|
      puts "#{k}: #{v}"
    end
  end
end

