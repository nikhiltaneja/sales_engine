class Merchant 

  require 'bigdecimal'

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
    successful_invoices = invoices.find_all do |invoice|
      invoice.successful_transactions
    end
    total_invoices(successful_invoices)
  end
  
  def total_invoices(list_of_invoices)
    list_of_invoices.map do |invoice|
      invoice.calculate_invoice_total
    end.compact.reduce(:+)
  end

  def revenue(date = nil)
    if date == nil
      BigDecimal(convert_revenue(calculate_revenue))
    else
      BigDecimal(convert_revenue(calculate_revenue_with_date(date)))
    end
  end

  def convert_revenue(revenue)
    revenue.to_s.rjust(3,"0").insert(-3,".")
  end

  def calculate_revenue_with_date(date)
    successful_invoices = invoices.find_all do |invoice|
      invoice.successful_transactions && invoice.created_at == date
    end
    total_invoices(successful_invoices)
  end


end