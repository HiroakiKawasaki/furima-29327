class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_delivery = OrderDelivery.new
  end

  def create
    @order_delivery = OrderDelivery.new(order_delivery_params)
    @item = Item.find(params[:item_id])
    if @order_delivery.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_delivery_params[:token], # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @order_delivery.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_delivery_params
    params.permit(:user_id, :item_id, :post, :prefecture_id, :cities, :address, :building_name, :phone_number).merge(user_id: current_user.id, token: params[:token])
  end
end
