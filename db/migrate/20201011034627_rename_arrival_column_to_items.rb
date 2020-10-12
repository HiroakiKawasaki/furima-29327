class RenameArrivalColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :arrival, :arrival_id
  end
end
