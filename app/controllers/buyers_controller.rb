class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_items_index, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    @pay_form = PayForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @pay_form = PayForm.new(buyer_params)
    if @pay_form.valid?
      pay_item
      @pay_form.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def move_to_items_index
    @item = Item.find(params[:item_id])
    redirect_to items_path unless @item.user_id != current_user.id
    redirect_to items_path unless @item.buyer == nil
  end


  def buyer_params
    params.require(:pay_form).permit(:postal_code, :prefecture_id, :city, :numbering, :building, :phone).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buyer_params[:token],
      currency: 'jpy'
    )
  end
end
