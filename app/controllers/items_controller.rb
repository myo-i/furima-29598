class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
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
    @item = Item.find(params[:id])
    @user = @item.user
    @category = Genre.find(@item.category_id)
    @state = State.find(@item.product_state_id)
    @burden = Burden.find(@item.payment_burden_id)
    @area = Area.find(@item.area_id)
    @days = Day.find(@item.delivery_days_id)
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :product_state_id, :payment_burden_id, :area_id, :delivery_days_id, :price).merge(user_id: current_user.id)
  end
end
