gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/sales_engine'

class MerchantRepositoryTest < Minitest::Test
  attr_reader :repo

  def setup
    @repo = MerchantRepository.new("./test/fixtures/merchants.csv")
  end

  def test_it_exists
    @repo
    assert_kind_of MerchantRepository, @repo
  end

  def test_csv_filename
    assert_equal "./test/fixtures/merchants.csv", repo.filename
  end

  def test_load_merchants
    merchant = repo.all.first
    assert_equal "1", merchant.id 
    assert_equal "Schroeder-Jerde", merchant.name
  end

  def test_random_merchant
    merchant_one = repo.random
    merchant_two = repo.random
    10.times do
      break if merchant_one.id != merchant_two.id
      merchant_two = repo.random
    end
    refute_equal merchant_one.id, merchant_two.id
  end

  


end