class MerchantRepository
  attr_reader :filename, :engine

  def initialize(filename, engine=SalesEngine.new)
    @filename = filename
    @engine = engine
  end

  def all
    @all ||= build_merchants
  end

  def random
    all.sample
  end

  def find_by(attribute, match)
    all.find do |vendor| 
      vendor.send(attribute.to_sym).downcase.strip == match.downcase.strip
    end
  end

  def find_by_id(match)
    find_by(:id,match)
  end

  def find_by_name(match)
    find_by(:name,match)
  end

  def find_by_created_at(match)
    find_by(:created_at,match)
  end

  def find_by_updated_at(match)
    find_by(:updated_at,match)
  end
  
  def find_all_by(attribute, match)
    all.find_all do |merchant| 
      merchant.send(attribute.to_sym).downcase.strip == match.downcase.strip
    end
  end

  def find_all_by_id(match)
    find_all_by(:id, match)
  end

  def find_all_by_name(match)
    find_all_by(:name, match)
  end

  def find_all_by_created_at(match)
    find_all_by(:created_at, match)
  end

  def find_all_by_updated_at(match)
    find_all_by(:updated_at, match)
  end

  # def most_revenue(x)
  #   b = all.sort_by do |merchant|
  #     merchant.revenue 
  #   end
  #   sorted = b.reverse
  #   sorted[0, x]
  # end

  private

  def build_merchants
    data.map do |row|
      Merchant.new(row, engine)
    end
  end

  def data
    @data ||= CSV.open(filename, headers: true, header_converters: :symbol)
  end

end 