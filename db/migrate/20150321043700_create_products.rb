class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :item_code
      t.string :item_name
      t.string :item_type
      t.string :central_name
      t.string :origin
      t.string :class_type
      t.decimal :unit_cost, precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end
