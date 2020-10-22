class AddColumnDeliveries < ActiveRecord::Migration[6.0]
  def change
    add_reference :deliveries, :order, foreign_key: true
  end
end
