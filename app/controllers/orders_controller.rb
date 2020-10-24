class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_itemid, only: [:index, :create, :purchased, :listing_person]
  before_action :purchased, only: [:index]
  before_action :listing_person, only: [:index]
  require 'payjp'
  def index
    @order_delivery = OrderDelivery.new
  end

  def create
    @order_delivery = OrderDelivery.new(order_params)

    if @order_delivery.valid?
      pay_item
      @order_delivery.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_delivery).permit(:user_id, :item_id, :token, :postal_code, :area_id, :city, :block, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_itemid
    @item = Item.find(params[:item_id])
  end

  def purchased
    redirect_to root_path if @item.order.present?
  end

  def listing_person
    redirect_to root_path if current_user.id == @item.user_id
  end
end
