gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'csv'

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

end

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

end

class Item 
  attr_reader :id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at

  def initialize(input = {})
    @id = input[:id]
    @name = input[:name]
    @description = input[:description]
    @unit_price = input[:unit_price]
    @merchant_id = input[:merchant_id]
    @created_at = input[:created_at]
    @updated_at = input[:updated_at]
  end

end

class Merchant 
  attr_reader :id, :name, :created_at, :updated_at

  def initialize(input = {})
    @id = input[:id]
    @name = input[:name]
    @created_at = input[:created_at]
    @updated_at = input[:updated_at]
  end

end

class Transaction 
  attr_reader :id, :invoice_id, :credit_card_number, :credit_card_expiration_date, :result, :created_at, :updated_at

  def initialize(input = {})
    @id = input[:id]
    @invoice_id = input[:invoice_id]
    @credit_card_number = input[:credit_card_number]
    @credit_card_expiration_date = input[:credit_card_expiration_date]
    @result = input[:result]
    @created_at = input[:created_at]
    @updated_at = input[:updated_at]
  end
  
end

class MerchantRepository
  attr_reader :filename

  def initialize(filename = nil)
    @filename = filename
  end


  def all
    @all ||= build_merchants
  end



  # def random
  #   data.sample
  # end

  private

  def build_merchants
    data.map do |row|
      Merchant.new(row)
    end
  end

  def data
    @data ||= CSV.open(filename, headers: true, header_converters: :symbol)
  end

end 
