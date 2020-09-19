class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :status, :shipping_cost, :shipment_source, :shipping_day
  has_one_attached :image

end
