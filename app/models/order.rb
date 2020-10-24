class Order < ApplicationRecord
  has_one :delivery
  belongs_to :user
  belongs_to :item
end
