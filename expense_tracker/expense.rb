class Expense
  attr_accessor :id, :amount, :category, :note

  def initialize(id, amount, category, note)
    @id = id
    @amount = amount.to_f
    @category = category
    @note = note
  end

  def to_row
    [@id, @amount, @category, @note]
  end
end

