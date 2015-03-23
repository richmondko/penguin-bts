ActiveAdmin.register Salesman do

  menu parent: "Admin"

  permit_params :salesman_code, :salesman_name

  config.sort_order = "updated_at_desc"

  index do
    selectable_column
    column :salesman_code
    column :salesman_name
    column :updated_at
    actions dropdown: true
  end

  show title: :salesman_name do
    panel "Salesman Details" do
      attributes_table_for salesman do
        row  :salesman_code
        row  :salesman_name
        row  :created_at
        row  :updated_at
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs "Salesman Details" do
      f.input :salesman_code
      f.input :salesman_name
    end
    f.actions
  end

end
