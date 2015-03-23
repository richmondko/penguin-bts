ActiveAdmin.register Supplier do

  menu parent: "Admin"

  permit_params :supplier_code, :supplier_name, :supplier_type

  config.sort_order = "updated_at_desc"

  index do
    selectable_column
    column :supplier_code
    column :supplier_name
    column :supplier_type
    column :updated_at
    actions dropdown: true
  end

  show title: :supplier_name do
    panel "Supplier Details" do
      attributes_table_for supplier do
        row  :supplier_code
        row  :supplier_name
        row  :supplier_type
        row  :created_at
        row  :updated_at
      end
    end
    active_admin_comments
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
