class Merchant 
  attr_reader :id, :name, :created_at, :updated_at

  def initialize(input = {})
    @id = input[:id]
    @name = input[:name]
    @created_at = input[:created_at]
    @updated_at = input[:updated_at]
  end

  def items
    engine = SalesEngine.new
    items = engine.item_repository.all
    items.find_all do |item|
      item.merchant_id == self.id
    end
  end

end