class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @items = Item.all
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :image, :price, :text, :category_id, :state_id, :cost_id, :prefecture_id, :day_id)
  end
end
