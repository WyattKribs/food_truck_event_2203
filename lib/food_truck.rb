require './lib/item'

class FoodTruck
  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = {}
  end

  def stock_item(item, amount)
    @inventory[item] = (amount)
  end


  def stock(item, amount)
    added_stock = @inventory.fetch(item) + (amount)
    stock_item(item, added_stock)
  end

  def check_stock(item)
    @inventory.fetch(item)
  end

  
end
