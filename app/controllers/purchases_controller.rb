class PurchasesController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase = PurchaseAddress.new(purchase_params)
    if @purchase.valid?
        pay_item
        @purchase.save
      return redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def purchase_params
    params.permit(:token, :item_id, :postal_code, :prefectures_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id)
  end

  def item_info
    @item = Item.find(purchase_params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: item_info[:price],
      card: purchase_params[:token],
      currency:'jpy'
    )
  end
end
