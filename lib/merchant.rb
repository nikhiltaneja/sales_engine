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
    engine.item_repository.find_all_by_merchant_id(id)
  end

  def invoices
    engine.invoice_repository.find_all_by_merchant_id(id)
  end

  def calculate_revenue
    invoices.map do |invoice|
      if invoice.successful_transactions
        invoice.calculate_invoice_total
      end
    end.reduce(0,:+)
  end

  def revenue
    BigDecimal(calculate_revenue) / 100
  end

end