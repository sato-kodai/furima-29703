class ItemsController < ApplicationController
  def index
  end

  def new
  end

  private

  def item_params
    params.require(:item).permit(:name, :comment, :category_id, :status_id, :shipping_cost_id, :shipment_source_id, :shipping_days_id, :price,:imgage).merge(user: currrent_user.id)
  end
end
