gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/invoice_item_repository.rb'

class InvoiceItemRepositoryTest < Minitest::Test
  attr_reader :repo

  def setup
    @repo = InvoiceItemRepository.new("./test/fixtures/invoice_items.csv")
  end

  def test_it_exists
    assert_kind_of InvoiceItemRepository, @repo
  end

  def test_csv_filename
    assert_equal "./test/fixtures/invoice_items.csv", repo.filename
  end

  def test_load_invoice_items
    invoice_item = repo.all.first
    assert_equal "1", invoice_item.id 
    assert_equal "1", invoice_item.invoice_id
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
    data = {:id => "4",
            :item_id => "535",
            :invoice_id => "1",
            :quantity => "3",
            :unit_price => "2196",
            :created_at => "2012-03-27 14:54:09 UTC",
            :updated_at => "2012-03-27 14:54:09 UTC"}

    attribute = "item_id"
    match = "535"

    assert_equal data[:id], repo.find_by(attribute, match).id
    assert_equal data[:item_id], repo.find_by(attribute, match).item_id
    assert_equal data[:invoice_id], repo.find_by(attribute, match).invoice_id
    assert_equal data[:quantity], repo.find_by(attribute, match).quantity
    assert_equal data[:unit_price], repo.find_by(attribute, match).unit_price
    assert_equal data[:created_at], repo.find_by(attribute, match).created_at
    assert_equal data[:updated_at], repo.find_by(attribute, match).updated_at
  end

  def test_find_by_attribute_with_changed_case_and_space
    data = {:id => "4",
            :item_id => "535",
            :invoice_id => "1",
            :quantity => "3",
            :unit_price => "2196",
            :created_at => "2012-03-27 14:54:09 UTC",
            :updated_at => "2012-03-27 14:54:09 UTC"}

    attribute = "item_id"
    match = "535  "

    assert_equal data[:id], repo.find_by(attribute, match).id
    assert_equal data[:item_id], repo.find_by(attribute, match).item_id
    assert_equal data[:invoice_id], repo.find_by(attribute, match).invoice_id
    assert_equal data[:quantity], repo.find_by(attribute, match).quantity
    assert_equal data[:unit_price], repo.find_by(attribute, match).unit_price
    assert_equal data[:created_at], repo.find_by(attribute, match).created_at
    assert_equal data[:updated_at], repo.find_by(attribute, match).updated_at
  end

  def test_find_all_by_attribute
    data = {:id => "4",
            :item_id => "535",
            :invoice_id => "1",
            :quantity => "3",
            :unit_price => "2196",
            :created_at => "2012-03-27 14:54:09 UTC",
            :updated_at => "2012-03-27 14:54:09 UTC"}

    attribute = "invoice_id"
    match = "1"

    assert_equal 8, repo.find_all_by(attribute, match).count

  end

  def test_find_all_by_attribute_with_changed_case_and_space
    data = {:id => "4",
            :item_id => "535",
            :invoice_id => "1",
            :quantity => "3",
            :unit_price => "2196",
            :created_at => "2012-03-27 14:54:09 UTC",
            :updated_at => "2012-03-27 14:54:09 UTC"}

    attribute = "invoice_id"
    match = "1  "

    assert_equal 8, repo.find_all_by(attribute, match).count
  end

end
