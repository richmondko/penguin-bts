class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :customer_code
      t.string :customer_name
      t.string :address
      t.string :contact_numbers
      t.string :tin_number

      t.timestamps null: false
    end
  end
end
