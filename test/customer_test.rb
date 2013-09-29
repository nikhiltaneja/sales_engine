gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/customer'

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

  def test_it_can_find_invoices_from_customer_id
    data = {:id => '10', 
            :first_name => 'Ramona', 
            :last_name => 'Reynolds',
            :created_at => '2012-03-27 14:54:09 UTC',
            :updated_at => '2012-03-27 14:54:09 UTC'}
    engine = SalesEngine.new
    customer = Customer.new(data)
    invoices = engine.invoice_repository.find_all_by_customer_id("10")
    customer_count = customer.invoices.count
    assert_equal customer_count, invoices.count
  end

end
