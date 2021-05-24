class Item < ApplicationRecord
  extend ActiveHash: :Associations: :ActiveRecordExtentions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :estimated_shipping_date
end
