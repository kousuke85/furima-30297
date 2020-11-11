class UserOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :municipality, :address, :building_name, :phone_number, :purchaserecord_id, :user_id, :item_id,:token


  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefectures_id, numericality: { other_than: 0 }
    validates :municipality
    validates :address
    validates :phone_number, numericality: { only_integer: true },length: { maximum: 11 }
    validates :token
  end
  def save
    purchaserecord = Purchaserecord.create(item_id: item_id, user_id: user_id)
    Shippingaddress.create(postal_code: postal_code, prefectures_id: prefectures_id, municipality: municipality, address: address, building_name: building_name,phone_number: phone_number,purchaserecord_id: purchaserecord.id) 
  end
end