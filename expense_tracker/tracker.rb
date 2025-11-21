require 'csv'
require_relative 'expense'

class Tracker
  FILE = "data.csv"

  def initialize
    load_data
  end

  def load_data
    @expenses = []
    return unless File.exist?(FILE)
    CSV.foreach(FILE).with_index do |row, i|
      next if row.empty?
      @expenses << Expense.new(i+1, row[0], row[1], row[2])
    end
  end

  def save
    CSV.open(FILE, "w") do |csv|
      @expenses.each { |e| csv << e.to_row }
    end
  end

  def add(amount, category, note)
    id = @expenses.size + 1
    @expenses << Expense.new(id, amount, category, note)
    save
  end

  def list
    @expenses
  end
end

