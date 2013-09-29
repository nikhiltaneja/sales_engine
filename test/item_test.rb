gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'

class ItemTest < Minitest::Test

  def test_it_exists
    item = Item.new
    assert_kind_of Item, item
  end

  def test_it_is_initialized_from_a_hash_of_data
    data = {:id => '2',
            :name => 'Item Autem Minima',
            :description => 'Cumque consequuntur ad. Fuga tenetur illo molestias enim aut iste. Provident quo hic aut. Aut quidem voluptates dolores. Dolorem quae ab alias tempora.',
            :unit_price => '67076',
            :merchant_id => '1',
            :created_at => '2012-03-27 14:53:59 UTC',
            :updated_at => '2012-03-27 14:53:59 UTC'}
    
    item = Item.new(data)
    assert_equal data[:id], item.id
    assert_equal data[:name], item.name
    assert_equal data[:description], item.description
    assert_equal data[:unit_price], item.unit_price
    assert_equal data[:merchant_id], item.merchant_id
    assert_equal data[:created_at], item.created_at
    assert_equal data[:updated_at], item.updated_at
  end

  def test_it_returns_a_collection_of_invoice_items_associated_with_this_object
    data = {:id => '2',
            :name => 'Item Autem Minima',
            :description => 'Cumque consequuntur ad. Fuga tenetur illo molestias enim aut iste. Provident quo hic aut. Aut quidem voluptates dolores. Dolorem quae ab alias tempora.',
            :unit_price => '67076',
            :merchant_id => '1',
            :created_at => '2012-03-27 14:53:59 UTC',
            :updated_at => '2012-03-27 14:53:59 UTC'}
    engine = SalesEngine.new
    item = Item.new(data)
    invoice_items = engine.invoice_item_repository.find_all_by_item_id("2")
    invoice_item_count = item.invoice_items.count
    assert_equal invoice_items.count, invoice_item_count
  end

  def test_it_returns_an_instance_of_merchant_associated_with_this_object
    data = {:id => '2',
            :name => 'Item Autem Minima',
            :description => 'Cumque consequuntur ad. Fuga tenetur illo molestias enim aut iste. Provident quo hic aut. Aut quidem voluptates dolores. Dolorem quae ab alias tempora.',
            :unit_price => '67076',
            :merchant_id => '1',
            :created_at => '2012-03-27 14:53:59 UTC',
            :updated_at => '2012-03-27 14:53:59 UTC'}
    engine = SalesEngine.new
    merchant_items = Item.new(data)
    merchants = engine.merchant_repository.find_all_by_id("1")
    merchant_item_count = merchant_items.merchant.count
    assert_equal merchant_item_count, merchants.count
  end



end
