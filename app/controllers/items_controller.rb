class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    @item.user = current_user
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:title, :image, :price, :text, :user, :category_id, :state_id, :cost_id, :prefecture_id, :day_id)
  end
end
