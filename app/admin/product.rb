ActiveAdmin.register Product do

	menu parent: "Admin"

  permit_params :item_code, :item_name, :item_type, :central_name, :origin, :class_type, :unit_cost, 
    liens_attributes: [ :name, :lien_value ]
  
  index do
    selectable_column
    column :item_code
    column :item_name
    column :item_type
    column :central_name
    column :origin
    column :class_type
    column :unit_cost
    column :created_at
    column :updated_at
    actions
  end
  
  show do
    panel "Product Details" do
      table_for product do
        column :item_code
        column :item_name
        column :item_type
        column :central_name
        column :origin
        column :class_type
        column :unit_cost
        column :created_at
        column :updated_at
      end
    end
    panel "Liens" do
      table_for product.liens do
        column :name
        column :lien_value
      end
    end
    active_admin_comments
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
      f.inputs do
        f.has_many :liens, heading: 'Liens' do |a|
          a.input :name
          a.input :lien_value
        end
      end
    end
    f.actions
  end

end
