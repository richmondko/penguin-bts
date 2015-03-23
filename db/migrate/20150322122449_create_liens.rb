class CreateLiens < ActiveRecord::Migration
  def change
    create_table :liens do |t|
    	t.integer :product_id
      t.string :name
      t.decimal :cost, precision: 10, scale: 2
   
      t.timestamps null: false
    end

    add_index :liens, :product_id
  end
end
