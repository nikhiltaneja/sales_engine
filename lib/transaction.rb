require 'csv'

class Transaction 
  attr_reader :id, :invoice_id, :credit_card_number, :credit_card_expiration_date, :result, :created_at, :updated_at, :engine

  def initialize(input = {}, engine=SalesEngine.new)
    @id = input[:id]
    @invoice_id = input[:invoice_id]
    @credit_card_number = input[:credit_card_number]
    @credit_card_expiration_date = input[:credit_card_expiration_date]
    @result = input[:result]
    @created_at = input[:created_at]
    @updated_at = input[:updated_at]
    @engine = engine
  end

  def invoice
    engine.invoice_repository.find_by_id(invoice_id)
  end

  def failed?
    result == "failed"
  end
  
end