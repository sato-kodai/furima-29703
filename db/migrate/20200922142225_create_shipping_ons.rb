class CreateShippingOns < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_ons do |t|

      t.timestamps
    end
  end
end
