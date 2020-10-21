class OrderDelivery

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :order_id,:token, :postal_code, :area_id, :city, :block, :building_name, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :postal_code
    validates :area_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :block
    validates :phone_number
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Delivery.create(postal_code: postal_code, area_id: area_id, city: city, block: block, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end