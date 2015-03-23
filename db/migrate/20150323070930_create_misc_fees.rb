class CreateMiscFees < ActiveRecord::Migration
  def change
    create_table :misc_fees do |t|
    	t.integer :direct_purchase_id
      t.string :name
      t.decimal :cost, precision: 10, scale: 2

      t.timestamps null: false
    end

    add_index :misc_fees, :direct_purchase_id
    
  end
end
