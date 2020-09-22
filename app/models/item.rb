class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :shipment_source
  belongs_to_active_hash :shipping_days
  belongs_to :user
  has_one    :purchase
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :comment, length: { maximum: 1000 }
    validates :price, format: {with: /\A[0-9]+\z/ },
                      numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :status_id
    validates :shipping_cost_id
    validates :shipment_source_id
    validates :shipping_days_id
  end
end
