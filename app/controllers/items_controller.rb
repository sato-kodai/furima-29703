class ItemsController < ApplicationController
  before_action :move_to_show, only: [:edit]
  before_action :info_gets, only: [:edit, :update]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
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
    @item = Item.find(params[:id])
    if  @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :comment, :category_id, :status_id, :shipping_cost_id, :shipment_source_id, :shipping_days_id, :price).merge(user_id: current_user.id)
  end

  def move_to_show
    seller = Item.find(params[:id])
    redirect_to root_path unless current_user.id == seller.user_id
  end

  def info_gets
    @item = Item.find(params[:id])
  end
end
