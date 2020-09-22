class PurchasesController < ApplicationController
  def index
    @item = Item.new(params[:id])
  end

  def create
  end

end
