ActiveAdmin.register Salesman do

menu parent: "Admin"

  permit_params :salesman_code, :salesman_name

  index do
    selectable_column
    column :salesman_code
    column :salesman_name
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs "Salesman Details" do
      f.input :salesman_code
      f.input :salesman_name
    end
    f.actions
  end

end
