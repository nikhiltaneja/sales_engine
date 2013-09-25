gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/item_repository.rb'

class ItemRepositoryTest < Minitest::Test
  attr_reader :repo

  def setup
    @repo = ItemRepository.new("./test/fixtures/items.csv")
  end

  def test_it_exists
    assert_kind_of ItemRepository, @repo
  end

  def test_csv_filename
    assert_equal "./test/fixtures/items.csv", repo.filename
  end

  def test_load_items
    item = repo.all.first
    assert_equal "1", item.id 
    assert_equal "Item Qui Esse", item.name
  end

  def test_random_item
    item_one = repo.random
    item_two = repo.random
    10.times do
      break if item_one.id != item_two.id
      item_two = repo.random
    end
    refute_equal item_one.id, item_two.id
  end

  def test_find_by_attribute
    data = {:id => "4",
            :name => "Item Nemo Facere",
            :description => "Sunt eum id eius magni consequuntur delectus veritatis. Quisquam laborum illo ut ab. Ducimus in est id voluptas autem.",
            :unit_price => "4291",
            :merchant_id => "1",
            :created_at => "2012-03-27 14:53:59 UTC",
            :updated_at => "2012-03-27 14:53:59 UTC"}

    attribute = "name"
    match = "Item Nemo Facere"

    assert_equal data[:id], repo.find_by(attribute, match).id
    assert_equal data[:name], repo.find_by(attribute, match).name
    assert_equal data[:description], repo.find_by(attribute, match).description
    assert_equal data[:unit_price], repo.find_by(attribute, match).unit_price
    assert_equal data[:merchant_id], repo.find_by(attribute, match).merchant_id
    assert_equal data[:created_at], repo.find_by(attribute, match).created_at
    assert_equal data[:updated_at], repo.find_by(attribute, match).updated_at
  end

  def test_find_by_attribute_with_changed_case_and_space
    data = {:id => "4",
            :name => "Item Nemo Facere",
            :description => "Sunt eum id eius magni consequuntur delectus veritatis. Quisquam laborum illo ut ab. Ducimus in est id voluptas autem.",
            :unit_price => "4291",
            :merchant_id => "1",
            :created_at => "2012-03-27 14:53:59 UTC",
            :updated_at => "2012-03-27 14:53:59 UTC"}

    attribute = "name"
    match = "Item NEMO Facere  "

    assert_equal data[:id], repo.find_by(attribute, match).id
    assert_equal data[:name], repo.find_by(attribute, match).name
    assert_equal data[:description], repo.find_by(attribute, match).description
    assert_equal data[:unit_price], repo.find_by(attribute, match).unit_price
    assert_equal data[:merchant_id], repo.find_by(attribute, match).merchant_id
    assert_equal data[:created_at], repo.find_by(attribute, match).created_at
    assert_equal data[:updated_at], repo.find_by(attribute, match).updated_at
  end

  def test_find_all_by_attribute
    data = {:id => "4",
            :name => "Item Nemo Facere",
            :description => "Sunt eum id eius magni consequuntur delectus veritatis. Quisquam laborum illo ut ab. Ducimus in est id voluptas autem.",
            :unit_price => "4291",
            :merchant_id => "1",
            :created_at => "2012-03-27 14:53:59 UTC",
            :updated_at => "2012-03-27 14:53:59 UTC"}

    attribute = "merchant_id"
    match = "2"

    assert_equal 2, repo.find_all_by(attribute, match).count

  end

  def test_find_all_by_attribute_with_changed_case_and_space
    data = {:id => "4",
            :name => "Item Nemo Facere",
            :description => "Sunt eum id eius magni consequuntur delectus veritatis. Quisquam laborum illo ut ab. Ducimus in est id voluptas autem.",
            :unit_price => "4291",
            :merchant_id => "1",
            :created_at => "2012-03-27 14:53:59 UTC",
            :updated_at => "2012-03-27 14:53:59 UTC"}

    attribute = "merchant_id"
    match = "2   "

    assert_equal 2, repo.find_all_by(attribute, match).count
  end

end
