class Item 
  attr_reader :id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at, :engine

  def initialize(input = {}, engine=SalesEngine.new)
    @id = input[:id]
    @name = input[:name]
    @description = input[:description]
    @unit_price = input[:unit_price]
    @merchant_id = input[:merchant_id]
    @created_at = input[:created_at]
    @updated_at = input[:updated_at]
    @engine = engine
  end

  def invoice_items
    invoice_items = engine.invoice_item_repository.all
    invoice_items.find_all do |item|
      item.item_id == self.id
    end
  end

  def merchant
    merchants = engine.merchant_repository.all
    merchants.find_all do |merchant|
      merchant.id == self.merchant_id
    end
  end

end