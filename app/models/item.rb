class Item < ApplicationRecord
  belongs_to :user
  has_many :purchases
  has_one_attached :image

  HANKAKU_NUMBER = /\A[0-9]+\z/

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :state
  belongs_to_active_hash :burden
  belongs_to_active_hash :area
  belongs_to_active_hash :day

  validates :image, :name, :description, :category_id, :product_state_id, :payment_burden_id, :area_id, :delivery_days_id, :price, presence: true

  with_options numericality: { other_than: 1 } do
    validates :category_id, :product_state_id, :payment_burden_id, :delivery_days_id, :area_id
  end

  validates :price, format: { with: HANKAKU_NUMBER }

  validates :price, numericality: { greater_than: 300, less_than: 9999999 }
end
