gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/sales_engine'

class InvoiceItemTest < Minitest::Test

  def test_it_exists
    invoice_item = InvoiceItem.new
    assert_kind_of InvoiceItem, invoice_item
  end

  def test_it_is_initialized_from_a_hash_of_data
    data = {:id => '1',
            :item_id => '539',
            :invoice_id => '1',
            :quantity => '5',
            :unit_price => '13635',
            :created_at => '2012-03-27 14:54:09 UTC',
            :updated_at => '2012-03-27 14:54:09 UTC'}
    
    invoice_item = InvoiceItem.new(data)
    assert_equal data[:id], invoice_item.id
    assert_equal data[:item_id], invoice_item.item_id
    assert_equal data[:invoice_id], invoice_item.invoice_id
    assert_equal data[:quantity], invoice_item.quantity
    assert_equal data[:unit_price], invoice_item.unit_price
    assert_equal data[:created_at], invoice_item.created_at
    assert_equal data[:updated_at], invoice_item.updated_at
  end

end