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
    engine.transaction_repository.find_all_by_invoice_id(id)
  end

  def successful_transactions
    transactions.select do |transaction|
      transaction.result == "success"
    end
  end

  def failed_transactions
    transactions.select do |transaction|
      transaction.result == "failed"
    end
  end

  def invoice_items
    engine.invoice_item_repository.find_all_by_invoice_id(id)
  end

  def items
    engine.item_repository.find_all_by_id(invoice_items.item_id)
  end

  def customers
    engine.customer_repository.find_by_id(id)
  end

  def merchants
    engine.merchant_repository.find_by_id(id)
  end

end
