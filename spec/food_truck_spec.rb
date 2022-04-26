require 'rspec'
require './lib/item'
require './lib/food_truck'

describe FoodTruck do
  before(:each) do
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  end

  it "exists" do
    expect(@food_truck).to be_a(FoodTruck)
  end

  it "has a name" do
    expect(@food_truck.name).to eq("Rocky Mountain Pies")
  end

  it "has no inventory by default" do
    expect(@food_truck.inventory).to eq({})
  end

  it "can stock items" do
    @food_truck.stock_item(@item1, 0)
    expect(@food_truck.inventory).to eq({@item1 => 0})
  end

  it "can check if items are in stock" do
    @food_truck.stock_item(@item1, 0)
    expect(@food_truck.check_stock(@item1)).to eq(0)
  end

  it "can add stock" do
    @food_truck.stock_item(@item1, 0)
    @food_truck.stock(@item1, 25)
    @food_truck.stock(@item1, 30)
    # require 'pry' ; binding.pry
    expect(@food_truck.check_stock(@item1)).to eq(55)
  end
end
