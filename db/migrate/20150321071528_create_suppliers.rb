class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :supplier_code
      t.string :supplier_name
      t.string :supplier_type

      t.timestamps null: false
    end
  end
end
