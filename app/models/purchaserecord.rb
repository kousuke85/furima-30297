class Purchaserecord < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :shippingaddress
end
