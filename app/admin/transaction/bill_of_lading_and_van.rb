ActiveAdmin.register BillOfLadingAndVan do

  menu parent: "Transaction"

  permit_params :bl_date, :supplier, :shipping_line, :vessel, :voyage, 
  :bl_number, :van_number, :product, :reference_number, :quantity

  config.sort_order = "updated_at_desc"

  index do
    selectable_column
    column "Date" do |bill_of_lading_and_van|
      bill_of_lading_and_van.bl_date
    end
    column "Reference #" do |bill_of_lading_and_van|
      bill_of_lading_and_van.reference_number
    end
    column :supplier
    column :product
    column :quantity
    column :shipping_line
    column :vessel
    column :voyage
    column "Bill of Lading #" do |bill_of_lading_and_van|
      bill_of_lading_and_van.bl_number
    end
    column "Van #" do |bill_of_lading_and_van|
      bill_of_lading_and_van.van_number
    end
    column :updated_at
    actions dropdown: true
  end

  show title: :bl_number do
    panel "Bill Of Lading and Van" do
      attributes_table_for bill_of_lading_and_van do
        row "Date" do
          bill_of_lading_and_van.bl_date
        end
        row "Reference #" do
          bill_of_lading_and_van.reference_number
        end
        row :supplier
      end
    end
    panel "Details" do
      attributes_table_for bill_of_lading_and_van do
        row :product
        row :quantity
        row :shipping_line
        row :vessel
        row :voyage
        row "Bill of Lading #" do
          bill_of_lading_and_van.bl_number
        end
        row "Van #" do
          bill_of_lading_and_van.van_number
        end
        row :created_at
        row :updated_at
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs "Bill Of Lading and Van" do
      f.input :bl_date, as: :datepicker, label: "Date"
      f.input :reference_number, label: "Reference #", :as => :select, :collection => DirectPurchase.all.map {|direct_purchase| [direct_purchase.reference_number, direct_purchase.reference_number]}, :input_html_options => { :class => 'chosen'}
      f.input :supplier, :as => :select, :collection => Supplier.all.map {|supplier| [supplier.supplier_name, supplier.supplier_name]}, :input_html_options => { :class => 'chosen'}
    end
    f.inputs "Details" do
      f.input :product, :as => :select, :collection => Product.all.map {|product| [product.item_name, product.item_name, product.item_name]}, :input_html_options => { :class => 'chosen'}
      f.input :quantity
      f.input :shipping_line
      f.input :vessel
      f.input :voyage
      f.input :bl_number, label: "Bill of lading #"
      f.input :van_number, label: "Van #"
    end
    f.actions
  end

end
