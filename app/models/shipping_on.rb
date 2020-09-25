class ShippingOn < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipment_source
  belongs_to :purchase
end
