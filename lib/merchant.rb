class Merchant 
  attr_reader :id, :name, :created_at, :updated_at, :engine

  def initialize(input = {}, engine=SalesEngine.new)
    @id = input[:id]
    @name = input[:name]
    @created_at = input[:created_at]
    @updated_at = input[:updated_at]
    @engine = engine
  end

  def items
    items = engine.item_repository.all
    items.find_all do |item|
      item.merchant_id == self.id
    end
  end

  def invoices
    invoices = engine.invoice_repository.all
    invoices.find_all do |invoice|
      invoice.merchant_id == self.id
    end
  end

end