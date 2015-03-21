ActiveAdmin.register Product do

	menu parent: "Admin"

  permit_params :item_code, :item_name, :item_type, :central_name, :origin, :class_type, :unit_cost, :liens
  
  index do
    selectable_column
    column :item_code
    column :item_name
    column :item_type
    column :central_name
    column :origin
    column :class_type
    column :unit_cost
    column :liens
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs "Product Details" do
      f.input :item_code
      f.input :item_name
      f.input :item_type, :as => :radio, :collection => ["Refine", "Raw", "Wash", "Misc"]
      f.input :central_name
      f.input :origin
      f.input :class_type
      f.input :unit_cost
      f.input :liens
    end
    f.actions
  end

end
