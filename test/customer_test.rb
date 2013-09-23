gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/sales_engine'

class CustomerTest < Minitest::Test

  def test_it_exists
    customer = Customer.new
    assert_kind_of Customer, customer
  end

  def test_it_is_initialized_from_a_hash_of_data
    data = {:id => '10', 
            :first_name => 'Ramona', 
            :last_name => 'Reynolds',
            :created_at => '2012-03-27 14:54:09 UTC',
            :updated_at => '2012-03-27 14:54:09 UTC'}
    customer = Customer.new(data)
    assert_equal data[:id], customer.id
    assert_equal data[:first_name], customer.first_name
    assert_equal data[:last_name], customer.last_name
    assert_equal data[:created_at], customer.created_at
    assert_equal data[:updated_at], customer.updated_at
  end

end