class Customer
  attr_reader :id, :first_name, :last_name, :created_at, :updated_at

  def initialize(input = {})
    @id = input[:id]
    @first_name = input[:first_name]
    @last_name = input[:last_name]
    @created_at = input[:created_at]
    @updated_at = input[:updated_at]
  end

  def invoices
    engine = SalesEngine.new
    invoices = engine.invoice_repository.all
    invoices.find_all do |invoice|
      invoice.customer_id == self.id
    end
  end

end
