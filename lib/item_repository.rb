class ItemRepository
  attr_reader :filename

  def initialize(filename = nil)
    @filename = filename
  end

  def all
    @all ||= build_items
  end

  def random
    all.sample
  end

  def find_by(attribute, match)
    all.find do |item| 
      item.send(attribute.to_sym).downcase.strip == match.downcase.strip
    end
  end

  def find_by_id(match)
    find_by(:id,match)
  end

  def find_by_name(match)
    find_by(:name,match)
  end

  def find_by_description(match)
    find_by(:description,match)
  end

  def find_by_unit_price(match)
    find_by(:unit_price,match)
  end

  def find_by_merchant_id(match)
    find_by(:merchant_id,match)
  end

  def find_by_created_at(match)
    find_by(:created_at,match)
  end

  def find_by_updated_at(match)
    find_by(:updated_at,match)
  end

  def find_all_by(attribute, match)
    all.find_all do |item| 
      item.send(attribute.to_sym).downcase.strip == match.downcase.strip
    end
  end

  def find_all_by_id(match)
    find_all_by(:id,match)
  end

  def find_all_by_name(match)
    find_all_by(:name,match)
  end

  def find_all_by_description(match)
    find_all_by(:description,match)
  end

  def find_all_by_unit_price(match)
    find_all_by(:unit_price,match)
  end

  def find_all_by_merchant_id(match)
    find_all_by(:merchant_id,match)
  end

  def find_all_by_created_at(match)
    find_all_by(:created_at,match)
  end

  def find_all_by_updated_at(match)
    find_all_by(:updated_at,match)
  end

  private

  def build_items
    data.map do |row|
      Item.new(row)
    end
  end

  def data
    @data ||= CSV.open(filename, headers: true, header_converters: :symbol)
  end

end
