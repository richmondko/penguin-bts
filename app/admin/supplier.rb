ActiveAdmin.register Supplier do

  menu parent: "Admin"

  permit_params :supplier_code, :supplier_name, :supplier_type

  index do
    selectable_column
    column :supplier_code
    column :supplier_name
    column :supplier_type
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs "Supplier Details" do
      f.input :supplier_code
      f.input :supplier_name
      f.input :supplier_type, :as => :radio, :collection => ["Supplier", "Agent"]
    end
    f.actions
  end
end
