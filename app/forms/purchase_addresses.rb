class PurchaseAddresses

  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefectures_id, :municipality, :address, :building_name, :phone_number, :purchases_id, :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :item_id 
    validates :token
    validates :postal_code    , format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :prefectures_id , numericality: { other_than: 0 }
    validates :municipality
    validates :address
    validates :phone_number   ,format: { with: /\A[0-9]{11}\z/ }
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    ShippingOn.create(postal_code: postal_code, prefectures_id: prefectures_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end
