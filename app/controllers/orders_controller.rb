class OrdersController < ApplicationController
  
  def index
  end

  def create
    Order.create(order_params)
    redirect_to "/orders/#{order.item.id}"
  end

  private
  def order_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :status_id, :fee_id, :area_id, :arrival_id, :price).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
