gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/merchant_repository'

class MerchantRepositoryTest < Minitest::Test
  attr_reader :repo

  def setup
    @repo = MerchantRepository.new("./test/fixtures/merchants.csv")
  end

  def test_it_exists
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

  def test_find_by_attribute
    data = {:id => "7",
            :name => "Bernhard-Johns",
            :created_at => "2012-03-27 14:53:59 UTC",
            :updated_at => "2012-03-27 14:53:59 UTC"}

    attribute = "name"
    match = "Bernhard-Johns"

    assert_equal data[:id], repo.find_by(attribute, match).id
    assert_equal data[:name], repo.find_by(attribute, match).name
    assert_equal data[:created_at], repo.find_by(attribute, match).created_at
    assert_equal data[:updated_at], repo.find_by(attribute, match).updated_at
  end

  def test_find_by_attribute_with_changed_case_and_space
    data = {:id => "7",
            :name => "Bernhard-Johns",
            :created_at => "2012-03-27 14:53:59 UTC",
            :updated_at => "2012-03-27 14:53:59 UTC"}

    attribute = "name"
    match = "BerNhaRd-JoHns "

    assert_equal data[:id], repo.find_by(attribute, match).id
    assert_equal data[:name], repo.find_by(attribute, match).name
    assert_equal data[:created_at], repo.find_by(attribute, match).created_at
    assert_equal data[:updated_at], repo.find_by(attribute, match).updated_at
  end


  def test_find_all_by_attribute
    data = {
      id:         "5",
      name:       "Williamson Group",
      created_at: "2012-03-27 14:53:59 UTC",
      updated_at: "2012-03-27 14:53:59 UTC"
    }

    attribute = "name"
    match = "Williamson Group"

    assert_equal data[:id], repo.find_all_by(attribute, match).first.id
    assert_equal data[:name], repo.find_all_by(attribute, match).first.name
    assert_equal data[:created_at], repo.find_all_by(attribute, match).first.created_at
    assert_equal data[:updated_at], repo.find_all_by(attribute, match).first.updated_at

    assert_equal 2, repo.find_all_by(attribute, match).count

    merchant = repo.find_by_name("Williamson Group")
    assert_equal true, repo.find_all_by(attribute, match).include?(merchant)
  end

  def test_find_all_by_attribute_with_changed_case_and_space
    data = {
      id:         "5",
      name:       "Williamson Group",
      created_at: "2012-03-27 14:53:59 UTC",
      updated_at: "2012-03-27 14:53:59 UTC"
    }

    attribute = "name"
    match = "WiLliaMson GrOup "

    assert_equal data[:id], repo.find_all_by(attribute, match).first.id
    assert_equal data[:name], repo.find_all_by(attribute, match).first.name
    assert_equal data[:created_at], repo.find_all_by(attribute, match).first.created_at
    assert_equal data[:updated_at], repo.find_all_by(attribute, match).first.updated_at

    assert_equal 2, repo.find_all_by(attribute, match).count

    merchant = repo.find_by_name("WiLliaMson GrOup")
    assert_equal true, repo.find_all_by(attribute, match).include?(merchant)
  end




end