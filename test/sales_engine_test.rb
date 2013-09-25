gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/sales_engine'

class SalesEngineTest < Minitest::Test

  def setup
    @engine_test = SalesEngine.new
  end

  def test_it_exists
    assert_kind_of SalesEngine, @engine_test
  end

  def test_merchant_repository_instantiates
    data = {
      id:         "5",
      name:       "Williamson Group",
      created_at: "2012-03-27 14:53:59 UTC",
      updated_at: "2012-03-27 14:53:59 UTC"
    }

    assert_equal data[:name], @engine_test.merchant_repository.find_by_name("Williamson Group").name
  end

  def test_customer_repository_instantiates
    data = {:id => "1",
            :first_name => "Joey",
            :last_name => "Ondricka",
            :created_at => "2012-03-27 14:54:09 UTC",
            :updated_at => "2012-03-27 14:54:09 UTC"}

    assert_equal data[:first_name], @engine_test.customer_repository.find_by_first_name("Joey").first_name
  end

  def test_invoice_item_repository_instantiates
    data = {:id => "4",
            :item_id => "535",
            :invoice_id => "1",
            :quantity => "3",
            :unit_price => "2196",
            :created_at => "2012-03-27 14:54:09 UTC",
            :updated_at => "2012-03-27 14:54:09 UTC"}
    assert_equal data[:item_id], @engine_test.invoice_item_repository.find_by_item_id("535").item_id
  end

  def test_invoice_repository_instantiates
    data = {:id => "1",
            :customer_id => "1",
            :merchant_id => "26",
            :status => "shipped",
            :created_at => "2012-03-25 09:54:09 UTC",
            :updated_at => "2012-03-25 09:54:09 UTC"}
    assert_equal data[:merchant_id], @engine_test.invoice_repository.find_by_merchant_id("26").merchant_id
  end

  def test_transaction_repository_instatiates
    data = {:id => "1",
            :invoice_id => "1",
            :credit_card_number => "4654405418249630",
            :result => "success",
            :created_at => "2012-03-27 14:54:09 UTC",
            :updated_at => "2012-03-27 14:54:09 UTC"}
    assert_equal data[:result], @engine_test.transaction_repository.find_by_result("success").result
  end

end