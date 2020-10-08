class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params) 
    @user = current_user
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end  
    @item.save
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category, :status, :fee, :area, :arrival, :price).merge(user_id: current_user.id)
  end

  def category_params
    params.require(:category).permit(:category)
  end

  def status_params
    params.require(:status).permit(:status)
  end

  def fee_params
    params.require(:fee).permit(:fee)
  end

  def area_params
    params.require(:area).permit(:area)
  end

  def arrival_params
    params.require(:arrival).permit(:arrival)
  end
end
