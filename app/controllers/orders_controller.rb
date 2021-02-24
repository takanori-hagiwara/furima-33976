class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  def index
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new
  end
    
  def create
     @order
  end
  

  private

  #def order_params
    #params.require(:order_address).permit(:postal_code, :street_address, :city, :building, :phone, :shipment_area, :item_id).merge(user_id: current_user.id)
  #end

   #def address_params
     #params.permit(:postal_code, :street_address, :city, :building, :phone, :shipment_area_id).merge(order_id: @order.id)
  #end
end
