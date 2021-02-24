class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
     @order_address = OrderAddress.new(order_params)
     if @order_address.valid?
        @order_address.save
       redirect_to root_path
     else
       render :index
     end
   end
  

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :shipment_area_id, :city, :street_address, :building, :phone ).merge(item_id: params[:item_id], user_id: current_user.id)
  end
end