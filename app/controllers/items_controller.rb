class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new 
    @categories = Category.all
  end

  def create
  end

  def item_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end

  def category_params
    params.require(:category).permit(:category)
  end

end
