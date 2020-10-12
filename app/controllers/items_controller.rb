class ItemsController < ApplicationController
# skip_before_action
  def new
    @item = Item.new
  end

  def create
    binding.pry
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end  
    @item.save
  end

  def index
    @items = Item.all.order("created_at DESC")
  end

  def show
    @item = Item.find(params[:id])
    @user = User.find(params[:id])
  end
  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :status_id, :fee_id, :area_id, :arrival_id, :price).merge(user_id: current_user.id)
  end
end
