class OrderDelivery
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :order_id, :token, :postal_code, :area_id, :city, :block, :building_name, :phone_number

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :area_id
    validates :city
    validates :block
    validates :phone_number, length: { maximum: 11 }
  end

  validates :area_id, numericality: { other_than: 1 }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Delivery.create(postal_code: postal_code, area_id: area_id, city: city, block: block, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
