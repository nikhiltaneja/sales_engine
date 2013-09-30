class Customer
  attr_reader :id, :first_name, :last_name, :created_at, :updated_at, :engine

  def initialize(input = {}, engine=SalesEngine.new)
    @id = input[:id]
    @first_name = input[:first_name]
    @last_name = input[:last_name]
    @created_at = input[:created_at]
    @updated_at = input[:updated_at]
    @engine = engine
  end

  def invoices
    invoices = engine.invoice_repository.all
    invoices.find_all do |invoice|
      invoice.customer_id == self.id
    end
  end

end
