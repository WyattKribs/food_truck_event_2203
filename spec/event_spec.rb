require 'rspec'
require './lib/item'
require './lib/food_truck'
require './lib/event'

describe Event do
  before(:each) do
    @event = Event.new("South Pearl Street Farmers Market")
    @food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    @food_truck3 = FoodTruck.new("Palisade Peach Shack")
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
  end

  it "exists" do
    expect(@event).to be_a(Event)
  end

  it "has a name" do
    expect(@event.name).to eq("South Pearl Street Farmers Market")
  end

  it "has no trucks by default" do
    expect(@event.food_trucks).to eq([])
  end

  it "can add food trucks" do
    @event.add_food_truck(@food_truck1)
    @event.add_food_truck(@food_truck2)
    @event.add_food_truck(@food_truck3)
    expect(@event.food_trucks).to eq([@food_truck1, @food_truck2, @food_truck3])
  end

  it "can tell you the truck names" do
    @event.add_food_truck(@food_truck1)
    @event.add_food_truck(@food_truck2)
    @event.add_food_truck(@food_truck3)
    expect(@event.food_truck_names).to eq(["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
  end

  it "can tell you where to find an item" do
    @event.add_food_truck(@food_truck1)
    @event.add_food_truck(@food_truck2)
    @food_truck1.stock_item(@item1, 0)
    @food_truck1.stock(@item1, 35)
    @food_truck2.stock_item(@item4, 0)
    @food_truck2.stock(@item4, 35)
    expect(@event.food_trucks_that_sell(@item1)).to eq([@food_truck1])
    expect(@event.food_trucks_that_sell(@item4)).to eq([@food_truck2])
  end

  it "can tell you potential revenue" do
    @food_truck1.stock_item(@item1, 0)
    @food_truck1.stock_item(@item2, 0)
    @food_truck1.stock(@item1, 35)
    @food_truck1.stock(@item2, 7)
    exect(@food_truck1.potential_revenue).to eq(148.75)
  end

end
