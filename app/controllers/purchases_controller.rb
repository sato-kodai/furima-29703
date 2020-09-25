class PurchasesController < ApplicationController
  before_action :seller_move_index, only: [:index]
  before_action :move_to_root, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @purchase = PurchaseAddresses.new
  end

  def create
    @purchase = PurchaseAddresses.new(purchase_params)
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
  def seller_move_index
    seller = Item.find(purchase_params[:item_id])
    redirect_to root_path unless current_user.id != seller.user_id
  end

  def move_to_root
    item = Item.find(params[:item_id])
    redirect_to root_path unless Purchase.where(item_id: Item.find(item.id)).blank?
  end

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
