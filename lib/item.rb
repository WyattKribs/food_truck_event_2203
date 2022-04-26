class Item
  attr_reader :item_info

  def initialize(item_info)
  @item_info = item_info
  end

  def name
    item_info.fetch(:name)
  end

  def price
    item_info.fetch(:price)
  end

end
