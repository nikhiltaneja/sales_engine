gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/transaction_repository'

class TransactionRepositoryTest < Minitest::Test
  attr_reader :repo

  def setup
    @repo = TransactionRepository.new("./test/fixtures/transactions.csv")
  end

  def test_it_exists
    assert_kind_of TransactionRepository, @repo
  end

  def test_csv_filename
    assert_equal "./test/fixtures/transactions.csv", repo.filename
  end

  def test_load_transaction
    transaction = repo.all.first
    assert_equal "1", transaction.id 
    assert_equal "1", transaction.invoice_id
  end

  def test_random_transaction
    transaction_one = repo.random
    transaction_two = repo.random
    10.times do
      break if transaction_one.id != transaction_two.id
      transaction_two = repo.random
    end
    refute_equal transaction_one.id, transaction_two.id
  end

  def test_find_by_attribute
    data = {:id => "1",
            :invoice_id => "1",
            :credit_card_number => "4654405418249630",
            :result => "success",
            :created_at => "2012-03-27 14:54:09 UTC",
            :updated_at => "2012-03-27 14:54:09 UTC"}

    attribute = "result"
    match = "success"

    assert_equal data[:id], repo.find_by(attribute, match).id
    assert_equal data[:invoice_id], repo.find_by(attribute, match).invoice_id
    assert_equal data[:credit_card_number], repo.find_by(attribute, match).credit_card_number
    assert_equal data[:result], repo.find_by(attribute, match).result
    assert_equal data[:created_at], repo.find_by(attribute, match).created_at
    assert_equal data[:updated_at], repo.find_by(attribute, match).updated_at
  end

  def test_find_by_attribute_with_changed_case_and_space
    data = {:id => "1",
            :invoice_id => "1",
            :credit_card_number => "4654405418249630",
            :result => "success",
            :created_at => "2012-03-27 14:54:09 UTC",
            :updated_at => "2012-03-27 14:54:09 UTC"}

    attribute = "result"
    match = "suCcEss "

    assert_equal data[:id], repo.find_by(attribute, match).id
    assert_equal data[:invoice_id], repo.find_by(attribute, match).invoice_id
    assert_equal data[:credit_card_number], repo.find_by(attribute, match).credit_card_number
    assert_equal data[:result], repo.find_by(attribute, match).result
    assert_equal data[:created_at], repo.find_by(attribute, match).created_at
    assert_equal data[:updated_at], repo.find_by(attribute, match).updated_at
  end

  def test_find_all_by_attribute
    data = {:id => "1",
            :invoice_id => "1",
            :credit_card_number => "4654405418249630",
            :result => "success",
            :created_at => "2012-03-27 14:54:09 UTC",
            :updated_at => "2012-03-27 14:54:09 UTC"}

    attribute = "result"
    match = "suCcEss "

    assert_equal data[:id], repo.find_all_by(attribute, match).first.id
    assert_equal data[:invoice_id], repo.find_all_by(attribute, match).first.invoice_id
    assert_equal data[:credit_card_number], repo.find_all_by(attribute, match).first.credit_card_number
    assert_equal data[:result], repo.find_all_by(attribute, match).first.result
    assert_equal data[:created_at], repo.find_all_by(attribute, match).first.created_at
    assert_equal data[:updated_at], repo.find_all_by(attribute, match).first.updated_at

    assert_equal 6, repo.find_all_by(attribute, match).count

    transaction = repo.find_by_result("success")
    assert_equal true, repo.find_all_by(attribute, match).include?(transaction)
  end

  def test_find_all_by_attribute_with_changed_case_and_space
    data = {:id => "1",
            :invoice_id => "1",
            :credit_card_number => "4654405418249630",
            :result => "success",
            :created_at => "2012-03-27 14:54:09 UTC",
            :updated_at => "2012-03-27 14:54:09 UTC"}

    attribute = "result"
    match = "suCcEss "

    assert_equal data[:id], repo.find_all_by(attribute, match).first.id
    assert_equal data[:invoice_id], repo.find_all_by(attribute, match).first.invoice_id
    assert_equal data[:credit_card_number], repo.find_all_by(attribute, match).first.credit_card_number
    assert_equal data[:result], repo.find_all_by(attribute, match).first.result
    assert_equal data[:created_at], repo.find_all_by(attribute, match).first.created_at
    assert_equal data[:updated_at], repo.find_all_by(attribute, match).first.updated_at

    assert_equal 6, repo.find_all_by(attribute, match).count

    transaction = repo.find_by_result("suCceSs ")
    assert_equal true, repo.find_all_by(attribute, match).include?(transaction)
  end




end