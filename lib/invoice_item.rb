class InvoiceItem
  attr_reader :id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at

  def initialize(input = {})
    @id = input[:id]
    @item_id = input[:item_id]
    @invoice_id = input[:invoice_id]
    @quantity = input[:quantity]
    @unit_price = input[:unit_price]
    @created_at = input[:created_at]
    @updated_at = input[:updated_at]
  end

  def invoice
    engine = SalesEngine.new
    invoices = engine.invoice_repository.all
    invoices.find_all do |invoice|
      invoice.id == self.invoice_id
    end
  end

  def item 
    engine = SalesEngine.new
    items = engine.invoice_repository.all
    items.find_all do |item|
      item.id == self.item_id
    end
  end

end