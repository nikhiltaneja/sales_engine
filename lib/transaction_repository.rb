class TransactionRepository

  attr_reader :filename, :engine

  def initialize(filename = nil, engine=SalesEngine.new)
    @filename = filename
    @engine = engine
  end

  def all
    @all ||= build_transactions
  end

  def random
    all.sample
  end

  def find_by(attribute, match)
    all.find do |transaction| 
      transaction.send(attribute.to_sym).downcase.strip == match.downcase.strip
    end
  end

  def find_by_id(match)
    find_by(:id,match)
  end

  def find_by_invoice_id(match)
    find_by(:invoice_id,match)
  end

  def find_by_credit_card_number(match)
    find_by(:credit_card_number,match)
  end 

  def find_by_credit_card_expiration_date(match)
    find_by(:credit_card_expiration_date,match)
  end 

  def find_by_result(match)
    find_by(:result,match)
  end 

  def find_by_created_at(match)
    find_by(:created_at,match)
  end

  def find_by_updated_at(match)
    find_by(:updated_at,match)
  end

  def find_all_by(attribute, match)
    all.find_all do |transaction| 
      transaction.send(attribute.to_sym).downcase.strip == match.downcase.strip
    end
  end

  def find_all_by_id(match)
    find_all_by(:id,match)
  end

  def find_all_by_invoice_id(match)
    find_all_by(:invoice_id,match)
  end

  def find_all_by_credit_card_number(match)
    find_all_by(:credit_card_number,match)
  end
  
  def find_all_by_credit_card_expiration_date(match)
    find_all_by(:credit_card_expiration_date,match)
  end

  def find_all_by_result(match)
    find_all_by(:result,match)
  end

  def find_all_by_created_at(match)
    find_all_by(:created_at,match)
  end

  def find_all_by_updated_at(match)
    find_all_by(:updated_at,match)
  end

  private

  def build_transactions
    data.map do |row|
      Transaction.new(row, engine)
    end
  end

  def data
    @data ||= CSV.open(filename, headers: true, header_converters: :symbol)
  end

end