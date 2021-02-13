class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :get_id, only:[:show, :edit, :update, :move_to_index]
  before_action :move_to_index, only:[:edit, :update]
  

  def index
    @items = Item.order('created_at DESC')
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :image, :price, :text, :category_id, :state_id, :cost_id, :prefecture_id, :day_id)
  end

  def move_to_index
    unless @item.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def get_id
    @item = Item.find(params[:id])
  end
end
