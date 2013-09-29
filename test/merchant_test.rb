gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/merchant'

class MerchantTest < Minitest::Test

  def test_it_exists
    merchant = Merchant.new
    assert_kind_of Merchant, merchant
  end

  def test_it_is_initialized_from_a_hash_of_data
    data = {:id => '7',
            :name =>  'Bernhard-Johns',
            :created_at => '2012-03-27 14:53:59 UTC',
            :updated_at => '2012-03-27 14:53:59 UTC'}
    
    merchant = Merchant.new(data)
    assert_equal data[:id], merchant.id
    assert_equal data[:name], merchant.name
    assert_equal data[:created_at], merchant.created_at
    assert_equal data[:updated_at], merchant.updated_at
  end

  def test_it_can_find_items_based_on_merchant_id
    data = {:id => '7',
            :name =>  'Bernhard-Johns',
            :created_at => '2012-03-27 14:53:59 UTC',
            :updated_at => '2012-03-27 14:53:59 UTC'}
    engine = SalesEngine.new
    merchant = Merchant.new(data)
    items = engine.item_repository.find_all_by_merchant_id("7")
    merchant_item_count = merchant.items.count
    assert_equal merchant_item_count, items.count

  end

  def test_it_can_find_invoices_based_on_merchant_id
    data = {:id => '7',
            :name =>  'Bernhard-Johns',
            :created_at => '2012-03-27 14:53:59 UTC',
            :updated_at => '2012-03-27 14:53:59 UTC'}
    engine = SalesEngine.new
    merchant = Merchant.new(data)
    invoices = engine.invoice_repository.find_all_by_merchant_id("7")
    merchant_invoice_count = merchant.invoices.count
    assert_equal merchant_invoice_count, invoices.count
  end

end
