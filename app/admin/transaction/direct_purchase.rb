ActiveAdmin.register DirectPurchase do

  menu parent: "Transaction"

  permit_params :purchase_date, :supplier, :product, :quantity, :unit_cost, :commission_rate, 
  :total_unit_cost, :witholding_tax, :commission_amount, :payable_gross, :payable_net, :reference_number,
  misc_fees_attributes: [ :id, :direct_purchase_id, :name, :cost, :_destroy ]

  config.sort_order = "updated_at_desc"

  index do
    selectable_column
    column :purchase_date
    column :supplier
    column :product
    column :quantity
    column :unit_cost do |direct_purchase|
      number_to_currency(direct_purchase.unit_cost, unit: "₱")
    end
    column :commission_rate do |direct_purchase|
      number_to_currency(direct_purchase.commission_rate, unit: "₱")
    end
    column :total_unit_cost do |direct_purchase|
      number_to_currency(direct_purchase.total_unit_cost, unit: "₱")
    end
    column :witholding_tax do |direct_purchase|
      number_to_currency(direct_purchase.witholding_tax, unit: "₱")
    end
    column :commission_amount do |direct_purchase|
      number_to_currency(direct_purchase.commission_amount, unit: "₱")
    end
    column :payable_gross do |direct_purchase|
      number_to_currency(direct_purchase.payable_gross, unit: "₱")
    end
    column :payable_net do |direct_purchase|
      number_to_currency(direct_purchase.payable_net, unit: "₱")
    end
    column :reference_number
    column :updated_at
    actions dropdown: true
  end

  show title: :reference_number do
    panel "Direct Purchase Details" do
      attributes_table_for direct_purchase do
        row :purchase_date
        row :supplier
        row :product
        row :quantity
        row :unit_cost  do |direct_purchase|
          number_to_currency(direct_purchase.unit_cost, unit: "₱")
        end
        row :commission_rate do |direct_purchase|
          number_to_currency(direct_purchase.commission_rate, unit: "₱")
        end
        row :total_unit_cost do |direct_purchase|
          number_to_currency(direct_purchase.total_unit_cost, unit: "₱")
        end
        panel "Misc Fees" do
          table_for direct_purchase.misc_fees do
            column :name
            column :cost do |misc_fee|
              number_to_currency(misc_fee.cost, unit: "₱")
            end
          end
        end
        row :witholding_tax do |direct_purchase|
          number_to_currency(direct_purchase.witholding_tax, unit: "₱")
        end
        row :commission_amount do |direct_purchase|
          number_to_currency(direct_purchase.commission_amount, unit: "₱")
        end
        row :payable_gross do |direct_purchase|
          number_to_currency(direct_purchase.payable_gross, unit: "₱")
        end
        row :payable_net do |direct_purchase|
          number_to_currency(direct_purchase.payable_net, unit: "₱")
        end
        row :reference_number
        row :created_at
        row :updated_at
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs "Direct Purchase Details" do
      f.input :purchase_date, as: :datepicker
      f.input :supplier, :as => :select, :collection => Supplier.all.map {|supplier| [supplier.supplier_name, supplier.supplier_name]}, :input_html_options => { :class => 'chosen'}
      f.input :product, :as => :select, :collection => Product.all.map {|product| [product.item_name, product.item_name]}, :input_html_options => { :class => 'chosen'}
      f.input :quantity
      f.input :unit_cost
      #:input_html => {:value => 0}
      f.input :commission_rate
      f.input :total_unit_cost 
      #, :input_html => { :readonly => true }
      f.inputs do
        f.has_many :misc_fees, heading: 'Misc Fees', allow_destroy: true, new_record: "Add Misc Fee" do |misc_fee|
          misc_fee.input :name
          misc_fee.input :cost
        end
      end
      f.input :witholding_tax
      f.input :commission_amount
      f.input :payable_gross
      f.input :payable_net
      f.input :reference_number
    end
    f.actions
  end

end
