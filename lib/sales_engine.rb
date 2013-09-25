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
  attr_reader :dir

  def initialize(dir = './data/')
    @dir = dir
  end

  def merchant_repository
    MerchantRepository.new(@dir + 'merchants.csv')
  end

  def customer_repository
    CustomerRepository.new(@dir + 'customers.csv')
  end

  def invoice_repository
    InvoiceRepository.new(@dir + 'invoices.csv')
  end

  def item_repository
    ItemRepository.new(@dir + 'items.csv')
  end

  def invoice_item_repository
    InvoiceItemRepository.new(@dir + 'invoice_items.csv')
  end

  def transaction_repository
    TransactionRepository.new(@dir + 'transactions.csv')
  end


end







