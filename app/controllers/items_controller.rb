class ItemsController < ApplicationController
<<<<<<< Updated upstream
  before_action :authenticate_user!, only: [:new]
=======
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:show, :edit]
>>>>>>> Stashed changes
  def index
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

<<<<<<< Updated upstream
=======
  def show
  end

  def edit
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to root_path
  end

>>>>>>> Stashed changes
  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :product_state_id, :payment_burden_id, :area_id, :delivery_days_id, :price).merge(user_id: current_user.id)
  end
end
