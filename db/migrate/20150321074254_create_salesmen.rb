class CreateSalesmen < ActiveRecord::Migration
  def change
    create_table :salesmen do |t|
      t.string :salesman_code
      t.string :salesman_name

      t.timestamps null: false
    end
  end
end
