class Invoice 
  attr_reader :id, :customer_id, :merchant_id, :status, :created_at, :updated_at, :engine

  def initialize(input = {}, engine=SalesEngine.new)
    @id = input[:id]
    @customer_id = input[:customer_id]
    @merchant_id = input[:merchant_id]
    @status = input[:status]
    @created_at = input[:created_at]
    @updated_at = input[:updated_at]
    @engine = engine
  end

  def transactions
    transactions = engine.transaction_repository.all
    transactions.find_all do |transaction|
      transaction.invoice_id == self.id
    end
  end

  def invoice_items
    invoice_items = engine.invoice_item_repository.all
    invoice_items.find_all do |invoice_item|
      invoice_item.invoice_id == self.id
    end
  end

  def items
    invoice_items.map do |invoice_item|
      engine.item_repository.find_by_id(invoice_item.item_id)
    end
  end

  def customers
    customers = engine.customer_repository.all
    customers.find_all do |customer|
      customer.id == self.id
    end
  end

  def merchants
    merchants = engine.merchant_repository.all
    merchants.find_all do |merchant|
      merchant.id == self.id
    end
  end

end
