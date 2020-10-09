class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:show, :edit]

  

  def index
    @items = Item.all.order("created_at DESC")
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


  def show
  end

  def edit
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to root_path
  end


  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :product_state_id, :payment_burden_id, :area_id, :delivery_days_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
