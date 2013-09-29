class Invoice 
  attr_reader :id, :customer_id, :merchant_id, :status, :created_at, :updated_at

  def initialize(input = {})
    @id = input[:id]
    @customer_id = input[:customer_id]
    @merchant_id = input[:merchant_id]
    @status = input[:status]
    @created_at = input[:created_at]
    @updated_at = input[:updated_at]
  end

  def transactions
    engine = SalesEngine.new
    transactions = engine.transaction_repository.all
    transactions.find_all do |transaction|
      transaction.invoice_id == self.id
    end
  end

  def invoice_items
    engine = SalesEngine.new
    invoice_items = engine.invoice_item_repository.all
    invoice_items.find_all do |invoice_item|
      invoice_item.invoice_id == self.id
    end
  end

  # def items
  #   engine = SalesEngine.new
  #   items = engine.item_repository.all
  #   items_id = items.find_all do |item|
  #     item.id == self.id
  #   end
  # end

  def customers
    engine = SalesEngine.new
    customers = engine.customer_repository.all
    customers.find_all do |customer|
      customer.id == self.id
    end
  end

  def merchants
    engine = SalesEngine.new
    merchants = engine.merchant_repository.all
    merchants.find_all do |merchant|
      merchant.id == self.id
    end
  end

end
