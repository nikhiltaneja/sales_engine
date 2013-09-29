gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/transaction'

class TransactionTest < Minitest::Test

  def test_it_exists
    transaction = Transaction.new
    assert_kind_of Transaction, transaction
  end

  def test_it_is_initialized_from_a_hash_of_data
    data = {:id => '3',
            :invoice_id =>  '4',
            :credit_card_number => '4354495077693036',
            :credit_card_expiration_date => "",
            :result =>  'success',
            :created_at => '2012-03-27 14:54:10 UTC',
            :updated_at => '2012-03-27 14:54:10 UTC'}
    
    transaction = Transaction.new(data)
    assert_equal data[:id], transaction.id
    assert_equal data[:invoice_id], transaction.invoice_id
    assert_equal data[:credit_card_number], transaction.credit_card_number
    assert_equal data[:credit_card_expiration_date], transaction.credit_card_expiration_date
    assert_equal data[:result], transaction.result
    assert_equal data[:created_at], transaction.created_at
    assert_equal data[:updated_at], transaction.updated_at
  end

  def test_it_returns_the_instance_of_invoice_associated_with_this_object
    data = {:id => '3',
            :invoice_id =>  '4',
            :credit_card_number => '4354495077693036',
            :credit_card_expiration_date => "",
            :result =>  'success',
            :created_at => '2012-03-27 14:54:10 UTC',
            :updated_at => '2012-03-27 14:54:10 UTC'}
    engine = SalesEngine.new
    transaction = Transaction.new(data)
    transaction_invoices = engine.transaction_repository.find_all_by_id("3")
    transaction_invoice_count = transaction.invoice.count 
    assert_equal transaction_invoices.count, transaction_invoice_count
  end

end
