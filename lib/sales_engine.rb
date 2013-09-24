gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

class Customer
  attr_reader :id, :first_name, :last_name, :created_at, :updated_at

  def initialize(input = {})
    @id = input[:id]
    @first_name = input[:first_name]
    @last_name = input[:last_name]
    @created_at = input[:created_at]
    @updated_at = input[:updated_at]
  end

end

class InvoiceItem
  def initialize(input = {})

  end

end
