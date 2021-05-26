class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :estimated_shipping_date
  has_one_attached :image

  with_options presence: true do
    validates :item_name
    validates :text
    validates :price
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :estimated_shipping_date_id
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :estimated_shipping_date_id
  end

  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
