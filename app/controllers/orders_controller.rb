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
        pay_item
        @order_address.save
       redirect_to root_path
     else
       render :index
     end
   end
  

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :shipment_area_id, :city, :street_address, :building, :phone).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end
    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
end