class InvoiceItemRepository
  attr_reader :filename, :engine

  def initialize(filename = nil, engine=SalesEngine.new)
    @filename = filename
    @engine = engine
  end

  def all
    @all ||= build_invoice_items
  end

  def random
    all.sample
  end

  def find_by(attribute, match)
    all.find do |invoice_item| 
      invoice_item.send(attribute.to_sym).downcase.strip == match.downcase.strip
    end
  end

  def find_by_id(match)
    find_by(:id,match)
  end

  def find_by_item_id(match)
    find_by(:item_id,match)
  end

  def find_by_invoice_id(match)
    find_by(:invoice_id,match)
  end 

  def find_by_quantity(match)
    find_by(:quantity,match)
  end

  def find_by_unit_price(match)
    find_by(:unit_price,match)
  end

  def find_by_created_at(match)
    find_by(:created_at,match)
  end

  def find_by_updated_at(match)
    find_by(:updated_at,match)
  end

  def find_all_by(attribute, match)
    all.find_all do |invoice_item| 
      invoice_item.send(attribute.to_sym).downcase.strip == match.downcase.strip
    end
  end

  def find_all_by_id(match)
    find_all_by(:id,match)
  end

  def find_all_by_item_id(match)
    find_all_by(:item_id,match)
  end

  def find_all_by_invoice_id(match)
    find_all_by(:invoice_id,match)
  end

  def find_all_by_quantity(match)
    find_all_by(:quantity,match)
  end

  def find_all_by_unit_price(match)
    find_all_by(:unit_price,match)
  end

  def find_all_by_created_at(match)
    find_all_by(:created_at,match)
  end

  def find_all_by_updated_at(match)
    find_all_by(:updated_at,match)
  end

  private

  def build_invoice_items
    data.map do |row|
      InvoiceItem.new(row, engine)
    end
  end

  def data
    @data ||= CSV.open(filename, headers: true, header_converters: :symbol)
  end

end
