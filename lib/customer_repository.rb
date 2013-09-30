class CustomerRepository
  attr_reader :filename, :engine

  def initialize(filename = nil, engine=SalesEngine.new)
    @filename = filename
    @engine = engine
  end

  def all
    @all ||= build_customers
  end

  def random
    all.sample
  end

  def find_by(attribute, match)
    all.find do |customer| 
      customer.send(attribute.to_sym).downcase.strip == match.downcase.strip
    end
  end

  def find_by_id(match)
    find_by(:id,match)
  end

  def find_by_first_name(match)
    find_by(:first_name,match)
  end

  def find_by_last_name(match)
    find_by(:last_name,match)
  end 

  def find_by_created_at(match)
    find_by(:created_at,match)
  end

  def find_by_updated_at(match)
    find_by(:updated_at,match)
  end

  def find_all_by(attribute, match)
    all.find_all do |customer| 
      customer.send(attribute.to_sym).downcase.strip == match.downcase.strip
    end
  end

  def find_all_by_id(match)
    find_all_by(:id,match)
  end

  def find_all_by_first_name(match)
    find_all_by(:first_name,match)
  end

  def find_all_by_last_name(match)
    find_all_by(:last_name,match)
  end

  def find_all_by_created_at(match)
    find_all_by(:created_at,match)
  end

  def find_all_by_updated_at(match)
    find_all_by(:updated_at,match)
  end

  private

  def build_customers
    data.map do |row|
      Customer.new(row, engine)
    end
  end

  def data
    @data ||= CSV.open(filename, headers: true, header_converters: :symbol)
  end


end