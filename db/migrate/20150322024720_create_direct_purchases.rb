class CreateDirectPurchases < ActiveRecord::Migration
  def change
    create_table :direct_purchases do |t|
      t.string :supplier
      t.string :product
      t.integer :quantity
      t.decimal :unit_cost, precision: 10, scale: 2
      t.decimal :commission_rate, precision: 10, scale: 2
      t.decimal :total_unit_cost, precision: 10, scale: 2
      t.decimal :witholding_tax, precision: 10, scale: 2
      t.decimal :commission_amount, precision: 10, scale: 2
      t.decimal :payable_gross, precision: 10, scale: 2
      t.decimal :payable_net, precision: 10, scale: 2
      t.string :reference_number

      t.timestamps null: false
    end
  end
end
