class Item < ApplicationRecord
  extend ActiveHash: :Associations: :ActiveRecordExtentions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :estimated_shipping_date

  with_options presence: true do
    validates :item_name
    validates :text
    validates :price
  end

  with_options numericalty: {other_than: 1} do
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :estimated_shipping_date_id
  end

end
