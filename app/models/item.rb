class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :deliverycharge
  belongs_to_active_hash :deliveryarea
  belongs_to_active_hash :deliverydays
  belongs_to :user
  has_one :purchaserecord
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :text
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
    validates :image
  end
  validates :category_id,:condition_id,:deliverycharge_id,:deliveryarea_id,:deliverydays_id, numericality: { other_than: 0 }
end
