class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_num, :user_id

  with_optioons presence: true do
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :manucipality, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid"}
    validates :address, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー0-9\-]+\z/, message: "is invalid"}
    validates :phone_num, format: {with: /\A\d{11}\z/, message: "is invalid. Not include hyphen(-)"}
  end
end