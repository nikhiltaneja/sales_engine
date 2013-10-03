gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/customer'
require './lib/sales_engine'

class CustomerTest < Minitest::Test

  attr_reader :data

  def setup 
    @data = {:id => '10', 
            :first_name => 'Ramona', 
            :last_name => 'Reynolds',
            :created_at => '2012-03-27 14:54:09 UTC',
            :updated_at => '2012-03-27 14:54:09 UTC'}
  end

  def test_it_exists
    customer = Customer.new
    assert_kind_of Customer, customer
  end

  def test_it_is_initialized_from_a_hash_of_data
    customer = Customer.new(data)
    assert_equal data[:id], customer.id
    assert_equal data[:first_name], customer.first_name
    assert_equal data[:last_name], customer.last_name
    assert_equal data[:created_at], customer.created_at
    assert_equal data[:updated_at], customer.updated_at
  end

  def test_it_can_find_invoices_from_customer_id
    engine = SalesEngine.new("./test/fixtures")
    invoices = engine.invoice_repository.find_all_by_customer_id("1")
    assert_equal 8, invoices.count
  end

  def test_it_can_find_all_the_transactions_associated_with_this_customer
    data = {:id => '1', 
            :first_name => 'Ramona', 
            :last_name => 'Reynolds',
            :created_at => '2012-03-27 14:54:09 UTC',
            :updated_at => '2012-03-27 14:54:09 UTC'}
    engine = SalesEngine.new("./test/fixtures")
    customer = Customer.new(data, engine)
    assert_equal 7, customer.transactions.count
  end

end
