class BuyersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @pay_form = PayForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @pay_form = PayForm.new(buyer_params)
      if @pay_form.valid?
        @pay_form.save
        redirect_to root_path
      else
        render action: :index
      end
  end

  private
  def buyer_params
    params.require(:pay_form).permit(:postal_code, :prefecture_id, :city, :numbering, :building, :phone)
  end
end
