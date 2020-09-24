class CreateShippingOns < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_ons do |t|
      t.string     :postal_code    , null: false, default: ""
      t.integer    :prefectures_id , null: false
      t.string     :municipality   , null: false, default: ""
      t.string     :address        , null: false, default: ""
      t.string     :building_name               , default: ""
      t.string     :phone_number   , null: false, default: ""
      t.references :purchase      , null: false, foreign_key: true
      t.timestamps
    end
  end
end