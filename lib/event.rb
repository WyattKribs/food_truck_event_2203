require './lib/item'
require './lib/food_truck'

class Event
  attr_reader :name, :food_trucks
  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    names = []
    @food_trucks.each do |trucks|
      names << trucks.name
    end
    names
  end

  def food_trucks_that_sell(item)
    trucks_that_sell_it = []
    @food_trucks.each do |trucks|
      if trucks.inventory.keys.include?(item)
          # require 'pry' ; binding.pry
        trucks_that_sell_it << trucks
      end
    end
    trucks_that_sell_it
  end

  def potential_revenue
    item_price = []
    @food_trucks.each do |trucks|
      trucks.inventory.each do
        item_price << item.price.to_f
      end
      item_price.sum
    end

end
