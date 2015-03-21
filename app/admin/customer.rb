ActiveAdmin.register Customer do

  menu parent: "Admin"

  permit_params :customer_code, :customer_name, :address, :contact_numbers, :tin_number

  index do
    selectable_column
    column :customer_code
    column :customer_name
    column :address
    column :contact_numbers
    column :tin_number
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs "Customer Details" do
      f.input :customer_code
      f.input :customer_name
      f.input :address
      f.input :contact_numbers
      f.input :tin_number
    end
    f.actions
  end

end