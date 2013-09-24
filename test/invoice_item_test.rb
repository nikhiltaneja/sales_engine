gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/sales_engine'

class InvoiceItemTest < Minitest::Test

  def test_it_exists
    invoice_item = InvoiceItem.new
    assert_kind_of InvoiceItem, invoice_item
  end

  def test_it_is_initialized_from_a_has_of_data
    data = {:id => '1',
            :item_id => '',
            :invoice_id => '',
            :quantity => '',
            :unit_price => '',
            :created_at => '',
            :updated_at => ''}
    
    invoice_item = InvoiceItem.new(data)
    assert_equal data[:id], invoice_item.id
    assert_equal data[:item_id], invoice.item_id
    assert_equal data[:invoice_id], invoice.invoice_id
    assert_equal data[:quantity], invoice.quantity
    assert_equal data[:unit_price], invoice.unit_price
    assert_equal data[:created_at], invoice.created_at
    assert_equal data[:updated_at], invoice.updated_at
  end

end