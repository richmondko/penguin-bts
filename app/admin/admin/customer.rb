ActiveAdmin.register Customer do

  menu parent: "Admin"

  permit_params :customer_code, :customer_name, :address, :contact_numbers, :tin_number

  config.sort_order = "updated_at_desc"

  index do
    selectable_column
    column :customer_code
    column :customer_name
    column :address
    column :contact_numbers
    column :tin_number
    column :updated_at
    actions dropdown: true
  end

  show title: :customer_name do
    panel "Customer Details" do
      attributes_table_for customer do
        row  :customer_code
        row  :customer_name
        row  :address
        row  :contact_numbers
        row  :tin_number
        row  :created_at
        row  :updated_at
      end
    end
    active_admin_comments
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