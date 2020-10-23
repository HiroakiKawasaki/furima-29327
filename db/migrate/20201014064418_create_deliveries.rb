class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string  :post,          null: false
      t.integer :prefecture_id, null: false
      t.string  :cities,        null: false
      t.string  :address,       null: false
      t.string  :building_name
      t.string  :phone_number,  null: false

      t.timestamps
    end
  end
end
