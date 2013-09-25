gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/invoice_repository'

class InvoiceRepositoryTest < Minitest::Test
  attr_reader :repo

  def setup
    @repo = InvoiceRepository.new("./test/fixtures/invoices.csv")
  end

  def test_it_exists
    assert_kind_of InvoiceRepository, @repo
  end

  def test_csv_filename
    assert_equal "./test/fixtures/invoices.csv", repo.filename
  end

  def test_load_invoices
    invoice = repo.all.first
    assert_equal "1", invoice.id 
    assert_equal "26", invoice.merchant_id
  end

  def test_random_merchant
    invoice_one = repo.random
    invoice_two = repo.random
    10.times do
      break if invoice_one.id != invoice_two.id
      invoice_two = repo.random
    end
    refute_equal invoice_one.id, invoice_two.id
  end

  def test_find_by_attribute
    data = {:id => "1",
            :customer_id => "1",
            :merchant_id => "26",
            :status => "shipped",
            :created_at => "2012-03-25 09:54:09 UTC",
            :updated_at => "2012-03-25 09:54:09 UTC"}

    attribute = "customer_id"
    match = "1"

    assert_equal data[:id], repo.find_by(attribute, match).id
    assert_equal data[:customer_id], repo.find_by(attribute, match).customer_id
    assert_equal data[:merchant_id], repo.find_by(attribute, match).merchant_id
    assert_equal data[:created_at], repo.find_by(attribute, match).created_at
    assert_equal data[:updated_at], repo.find_by(attribute, match).updated_at
  end

   def test_find_by_attribute_with_changed_case_and_space
    data = {:id => "1",
            :customer_id => "1",
            :merchant_id => "26",
            :status => "shipped",
            :created_at => "2012-03-25 09:54:09 UTC",
            :updated_at => "2012-03-25 09:54:09 UTC"}

    attribute = "status"
    match = "sHippEd "

    assert_equal data[:id], repo.find_by(attribute, match).id
    assert_equal data[:customer_id], repo.find_by(attribute, match).customer_id
    assert_equal data[:merchant_id], repo.find_by(attribute, match).merchant_id
    assert_equal data[:created_at], repo.find_by(attribute, match).created_at
    assert_equal data[:updated_at], repo.find_by(attribute, match).updated_at
  end

  def test_find_all_by_attribute
    data = {:id => "1",
            :customer_id => "1",
            :merchant_id => "26",
            :status => "shipped",
            :created_at => "2012-03-25 09:54:09 UTC",
            :updated_at => "2012-03-25 09:54:09 UTC"}

    attribute = "status"
    match = "shipped"

    assert_equal data[:id], repo.find_all_by(attribute, match).first.id
    assert_equal data[:customer_id], repo.find_all_by(attribute, match).first.customer_id
    assert_equal data[:merchant_id], repo.find_all_by(attribute, match).first.merchant_id
    assert_equal data[:created_at], repo.find_all_by(attribute, match).first.created_at
    assert_equal data[:updated_at], repo.find_all_by(attribute, match).first.updated_at

    assert_equal 9, repo.find_all_by(attribute, match).count

    invoice = repo.find_by_merchant_id("26")
    assert_equal true, repo.find_all_by(attribute, match).include?(invoice)
  end

  def test_find_all_by_attribute_with_changed_case_and_space
    data = {:id => "1",
            :customer_id => "1",
            :merchant_id => "26",
            :status => "shipped",
            :created_at => "2012-03-25 09:54:09 UTC",
            :updated_at => "2012-03-25 09:54:09 UTC"}

    attribute = "status"
    match = "sHippEd "

    assert_equal data[:id], repo.find_all_by(attribute, match).first.id
    assert_equal data[:customer_id], repo.find_all_by(attribute, match).first.customer_id
    assert_equal data[:merchant_id], repo.find_all_by(attribute, match).first.merchant_id
    assert_equal data[:created_at], repo.find_all_by(attribute, match).first.created_at
    assert_equal data[:updated_at], repo.find_all_by(attribute, match).first.updated_at

    assert_equal 9, repo.find_all_by(attribute, match).count

    invoice = repo.find_by_merchant_id("26")
    assert_equal true, repo.find_all_by(attribute, match).include?(invoice)
  end

end

