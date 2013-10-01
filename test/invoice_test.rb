gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/invoice'

class InvoiceTest < Minitest::Test

  def test_it_exists
    invoice = Invoice.new
    assert_kind_of Invoice, invoice
  end

  def test_it_is_initialized_from_a_hash_of_data
    data = {:id => '1',
            :customer_id => '1',
            :merchant_id => '26',
            :status => 'shipped',
            :created_at => '2012-03-25 09:54:09 UTC',
            :updated_at => '2012-03-25 09:54:09 UTC'
    }
    invoice = Invoice.new(data)
    assert_equal data[:id], invoice.id
    assert_equal data[:customer_id], invoice.customer_id
    assert_equal data[:merchant_id], invoice.merchant_id
    assert_equal data[:status], invoice.status
    assert_equal data[:created_at], invoice.created_at
    assert_equal data[:updated_at], invoice.updated_at
  end

  def test_it_can_find_transactions_based_on_invoice_id
    engine = SalesEngine.new("./test/fixtures")
    transactions = engine.transaction_repository.find_all_by_invoice_id("1")
    assert_equal 1, transactions.count
  end

  def test_it_can_find_invoice_items_based_on_invoice_id
    engine = SalesEngine.new("./test/fixtures")
    invoice_items = engine.invoice_item_repository.find_all_by_invoice_id("1")
    assert_equal 8, invoice_items.count
  end

  def test_it_can_find_items_based_on_invoice_items
    engine = SalesEngine.new("./test/fixtures")
    items = engine.invoice_item_repository.find_all_by_item_id("539")
    assert_equal 1, items.count
  end

  def test_it_can_find_customer_based_on_customer_id
    engine = SalesEngine.new("./test/fixtures")
    customers = engine.customer_repository.find_all_by_id("1")
    assert_equal 1, customers.count
  end

  def test_it_can_find_merchant_based_on_merchant_id
    engine = SalesEngine.new("./test/fixtures")
    merchants = engine.merchant_repository.find_all_by_id("10")
    assert_equal 1, merchants.count
  end


end
