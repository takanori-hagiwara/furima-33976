class ItemsController < ApplicationController
  def index
  end

  def new
  end
  

  private

  def item_params
    params.require(:item).permit(:title, :price, :image, :description, :category_id, :condition_id, :delivery_fee_id, :shipment_area_id, :shipment_date_id).merge(user_id: current_user.id)
  end

end
