class OrdersController < ApplicationController
  require 'payjp'
  def index
    @order = Order.new
    @order_delivery = OrderDelivery.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order_delivery = OrderDelivery.new(order_params)
    
    if @order_delivery.valid?
      pay_item
      @order_delivery.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_delivery).permit(:user_id, :item_id, :token, :postal_code, :area_id, :city, :block, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],    
      currency:'jpy'                 
    )
  end
end
