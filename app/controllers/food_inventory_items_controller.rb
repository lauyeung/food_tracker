class FoodInventoryItemsController < ApplicationController

  def index
    @food_inventory_items = FoodInventoryItem.all
  end

  def show
  end

  def new
    @food_inventory_item = FoodInventoryItem.new
  end

  def create
    @food_inventory_item = FoodInventoryItem.new(food_inventory_item_params)
    if @food_inventory_item.save
      flash[:notice] = "Food inventory item successfully saved!"
      redirect_to food_inventory_items_path
    else
      render :new
    end

  end

  private

  def food_inventory_item_params
    params.require(:food_inventory_item).permit(:title, :description, :quantity)
  end

end
