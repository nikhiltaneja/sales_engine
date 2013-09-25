gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/sales_engine'

class CustomerRepositoryTest < Minitest::Test
  attr_reader :repo

  def setup
    @repo = CustomerRepository.new("./test/fixtures/customers.csv")
  end

  def test_it_exists
    assert_kind_of CustomerRepository, @repo
  end

  def test_csv_filename
    assert_equal "./test/fixtures/customers.csv", repo.filename
  end

  def test_load_customers
    customer = repo.all.first
    assert_equal "1", customer.id 
    assert_equal "Joey", customer.first_name
    assert_equal "Ondricka", customer.last_name
  end

  def test_random_customer
    customer_one = repo.random
    customer_two = repo.random
    10.times do
      break if customer_one.id != customer_two.id
      customer_two = repo.random
    end
    refute_equal customer_one.id, customer_two.id
  end

  def test_find_by_attribute
    data = {:id => "1",
            :first_name => "Joey",
            :last_name => "Ondricka",
            :created_at => "2012-03-27 14:54:09 UTC",
            :updated_at => "2012-03-27 14:54:09 UTC"}

    attribute = "first_name"
    match = "Joey"

    assert_equal data[:id], repo.find_by(attribute, match).id
    assert_equal data[:first_name], repo.find_by(attribute, match).first_name
    assert_equal data[:last_name], repo.find_by(attribute, match).last_name
    assert_equal data[:created_at], repo.find_by(attribute, match).created_at
    assert_equal data[:updated_at], repo.find_by(attribute, match).updated_at
  end

  def test_find_by_attribute_with_changed_case_and_space
    data = {:id => "1",
            :first_name => "Joey",
            :last_name => "Ondricka",
            :created_at => "2012-03-27 14:54:09 UTC",
            :updated_at => "2012-03-27 14:54:09 UTC"}

    attribute = "first_name"
    match = "jOeY "

    assert_equal data[:id], repo.find_by(attribute, match).id
    assert_equal data[:first_name], repo.find_by(attribute, match).first_name
    assert_equal data[:last_name], repo.find_by(attribute, match).last_name
    assert_equal data[:created_at], repo.find_by(attribute, match).created_at
    assert_equal data[:updated_at], repo.find_by(attribute, match).updated_at
  end

  def test_find_all_by_attribute
    data = {
      id:         "1",
      first_name: "Joey",
      last_name:  "Ondricka",     
      created_at: "2012-03-27 14:54:09 UTC",
      updated_at: "2012-03-27 14:54:09 UTC"
    }

    attribute = "first_name"
    match = "Joey"

    assert_equal data[:id], repo.find_all_by(attribute, match).first.id
    assert_equal data[:first_name], repo.find_all_by(attribute, match).first.first_name
    assert_equal data[:last_name], repo.find_all_by(attribute, match).first.last_name
    assert_equal data[:created_at], repo.find_all_by(attribute, match).first.created_at
    assert_equal data[:updated_at], repo.find_all_by(attribute, match).first.updated_at

    assert_equal 2, repo.find_all_by(attribute, match).count
  end

  def test_find_all_by_attribute_with_changed_case_and_space
    data = {
      id:         "1",
      first_name: "Joey",
      last_name:  "Ondricka",     
      created_at: "2012-03-27 14:54:09 UTC",
      updated_at: "2012-03-27 14:54:09 UTC"
    }

    attribute = "last_name"
    match = "onDrIcka "

    assert_equal data[:id], repo.find_all_by(attribute, match).first.id
    assert_equal data[:first_name], repo.find_all_by(attribute, match).first.first_name
    assert_equal data[:last_name], repo.find_all_by(attribute, match).first.last_name
    assert_equal data[:created_at], repo.find_all_by(attribute, match).first.created_at
    assert_equal data[:updated_at], repo.find_all_by(attribute, match).first.updated_at

    assert_equal 2, repo.find_all_by(attribute, match).count
  end




end