gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/sales_engine'

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

end
