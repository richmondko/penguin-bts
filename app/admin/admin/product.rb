ActiveAdmin.register Product do

	menu parent: "Admin"

  permit_params :item_code, :item_name, :item_type, :central_name, :origin, :class_type, :unit_cost, 
  liens_attributes: [ :id, :product_id, :name, :cost, :_destroy ]
  
  config.sort_order = "updated_at_desc"

  index do
    selectable_column
    column :item_code
    column :item_name
    column :item_type
    column :central_name
    column :origin
    column :class_type
    column :unit_cost do |product|
      number_to_currency(product.unit_cost, unit: "₱")
    end
    column :updated_at
    actions dropdown: true
  end
  
  show title: :item_name do
    panel "Product Details" do
      attributes_table_for product do
        row  :item_code
        row  :item_name
        row  :item_type
        row  :central_name
        row  :origin
        row  :class_type
        row  :unit_cost do |product|
          number_to_currency(product.unit_cost, unit: "₱")
        end
        row  :created_at
        row  :updated_at
      end
    end

    panel "Liens" do
      table_for product.liens do
        column :name
        column :cost do |lien|
          number_to_currency(lien.cost, unit: "₱")
        end
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs "Product Details" do
      f.input :item_code
      f.input :item_name
      f.input :item_type, :as => :radio, :input_html => { :checked => true }, :collection => ["Refine", "Raw", "Wash", "Misc"]
      f.input :central_name
      f.input :origin
      f.input :class_type
      f.input :unit_cost, :input_html => { :value => 0 }
      f.inputs do
        f.has_many :liens, heading: 'Liens', allow_destroy: true do |lien|
          lien.input :name
          lien.input :cost
        end
      end
    end
    f.actions
  end

end
