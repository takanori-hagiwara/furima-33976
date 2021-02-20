class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
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

  private

  def item_params
    params.require(:item).permit(:image, :title, :price, :description, :category_id, :condition_id, :delivery_fee_id,
                                 :shipment_area_id, :shipment_date_id).merge(user_id: current_user.id)
  end
end
