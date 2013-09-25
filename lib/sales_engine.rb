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

  def random
    all.sample
  end

  def find_by(attribute, match)
    all.find do |vendor| 
      vendor.send(attribute.to_sym).downcase.strip == match.downcase.strip
    end
  end

  def find_by_id(match)
    find_by(:id,match)
  end

  def find_by_name(match)
    find_by(:name,match)
  end

  def find_by_created_at(match)
    find_by(:created_at,match)
  end

  def find_by_updated_at(match)
    find_by(:updated_at,match)
  end
  
  def find_all_by(attribute, match)
    all.find_all do |vendor| 
      vendor.send(attribute.to_sym).downcase.strip == match.downcase.strip
    end
  end

  def find_all_by_id(match)
    find_all_by(:id, match)
  end

  def find_all_by_name(match)
    find_all_by(:name, match)
  end

  def find_all_by_created_at(match)
    find_all_by(:created_at, match)
  end

  def find_all_by_updated_at(match)
    find_all_by(:updated_at, match)
  end

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

class CustomerRepository
  attr_reader :filename

  def initialize(filename = nil)
    @filename = filename
  end

  def all
    @all ||= build_customers
  end

  def random
    all.sample
  end

  def find_by(attribute, match)
    all.find do |customer| 
      customer.send(attribute.to_sym).downcase.strip == match.downcase.strip
    end
  end

  def find_by_id(match)
    find_by(:id,match)
  end

  def find_by_first_name(match)
    find_by(:first_name,match)
  end

  def find_by_last_name(match)
    find_by(:last_name,match)
  end 

  def find_by_created_at(match)
    find_by(:created_at,match)
  end

  def find_by_updated_at(match)
    find_by(:updated_at,match)
  end

  def find_all_by(attribute, match)
    all.find_all do |customer| 
      customer.send(attribute.to_sym).downcase.strip == match.downcase.strip
    end
  end

  def find_all_by_id(match)
    find_all_by(:id,match)
  end

  def find_all_by_first_name(match)
    find_all_by(:first_name,match)
  end

  def find_all_by_last_name(match)
    find_all_by(:last_name,match)
  end

  def find_all_by_created_at(match)
    find_all_by(:created_at,match)
  end

  def find_all_by_updated_at(match)
    find_all_by(:updated_at,match)
  end

  private

  def build_customers
    data.map do |row|
      Customer.new(row)
    end
  end

  def data
    @data ||= CSV.open(filename, headers: true, header_converters: :symbol)
  end


end


class InvoiceRepository
  attr_reader :filename

  def initialize(filename = nil)
    @filename = filename
  end

  def all
    @all ||= build_invoices
  end

  def random
    all.sample
  end

  def find_by(attribute, match)
    all.find do |invoice| 
      invoice.send(attribute.to_sym).downcase.strip == match.downcase.strip
    end
  end

  def find_by_id(match)
    find_by(:id,match)
  end

  def find_by_customer_id(match)
    find_by(:customer_id,match)
  end

  def find_by_merchant_id(match)
    find_by(:merchant_id,match)
  end 

  def find_by_created_at(match)
    find_by(:created_at,match)
  end

  def find_by_updated_at(match)
    find_by(:updated_at,match)
  end

  def find_all_by(attribute, match)
    all.find_all do |invoice| 
      invoice.send(attribute.to_sym).downcase.strip == match.downcase.strip
    end
  end

  def find_all_by_id(match)
    find_all_by(:id,match)
  end

  def find_all_by_customer_id(match)
    find_all_by(:customer_id,match)
  end

  def find_all_by_merchant_id(match)
    find_all_by(:merchant_id,match)
  end

  def find_all_by_created_at(match)
    find_all_by(:created_at,match)
  end

  def find_all_by_updated_at(match)
    find_all_by(:updated_at,match)
  end

  private

  def build_invoices
    data.map do |row|
      Invoice.new(row)
    end
  end

  def data
    @data ||= CSV.open(filename, headers: true, header_converters: :symbol)
  end


end


class TransactionRepository

  attr_reader :filename

  def initialize(filename = nil)
    @filename = filename
  end

  def all
    @all ||= build_transactions
  end

  def random
    all.sample
  end

  def find_by(attribute, match)
    all.find do |transaction| 
      transaction.send(attribute.to_sym).downcase.strip == match.downcase.strip
    end
  end

  def find_by_id(match)
    find_by(:id,match)
  end

  def find_by_invoice_id(match)
    find_by(:invoice_id,match)
  end

  def find_by_credit_card_number(match)
    find_by(:credit_card_number,match)
  end 

  def find_by_credit_card_expiration_date(match)
    find_by(:credit_card_expiration_date,match)
  end 

  def find_by_result(match)
    find_by(:result,match)
  end 

  def find_by_created_at(match)
    find_by(:created_at,match)
  end

  def find_by_updated_at(match)
    find_by(:updated_at,match)
  end

  def find_all_by(attribute, match)
    all.find_all do |transaction| 
      transaction.send(attribute.to_sym).downcase.strip == match.downcase.strip
    end
  end

  def find_all_by_id(match)
    find_all_by(:id,match)
  end

  def find_all_by_invoice_id(match)
    find_all_by(:invoice_id,match)
  end

  def find_all_by_credit_card_number(match)
    find_all_by(:credit_card_number,match)
  end
  
  def find_all_by_credit_card_expiration_date(match)
    find_all_by(:credit_card_expiration_date,match)
  end

  def find_all_by_result(match)
    find_all_by(:result,match)
  end

  def find_all_by_created_at(match)
    find_all_by(:created_at,match)
  end

  def find_all_by_updated_at(match)
    find_all_by(:updated_at,match)
  end

  private

  def build_transactions
    data.map do |row|
      Transaction.new(row)
    end
  end

  def data
    @data ||= CSV.open(filename, headers: true, header_converters: :symbol)
  end

end

