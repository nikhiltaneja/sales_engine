gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require_relative 'merchant'
require_relative 'merchant_repository'
require_relative 'customer'
require_relative 'customer_repository'
require_relative 'invoice'
require_relative 'invoice_repository'
require_relative 'invoice_item'
require_relative 'invoice_item_repository'
require_relative 'item'
require_relative 'item_repository'
require_relative 'transaction'
require_relative 'transaction_repository'



class SalesEngine


  def merchant_repository
    MerchantRepository.new('./data/merchants.csv')
  end

  def customer_repository 
    CustomerRepository.new('./data/customers.csv')
  end

  def invoice_repository
    InvoiceRepository.new('./data/invoices.csv')
  end

  def item_repository
    ItemRepository.new('./data/items.csv')
  end

  def invoice_item_repository
    InvoiceItemRepository.new('./data/invoice_items.csv')
  end

  def transaction_repository
    TransactionRepository.new('./data/transactions.csv')
  end


end







