class CreateBillOfLadingAndVans < ActiveRecord::Migration
  def change
    create_table :bill_of_lading_and_vans do |t|
      t.date :bl_date
      t.string :supplier
      t.string :shipping_line
      t.string :vessel
      t.string :voyage
      t.string :bl_number
      t.string :van_number
      t.string :product
      t.string :reference_number
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
