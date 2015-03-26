ActiveAdmin.register DirectPurchase do

  menu parent: "Transaction"

  permit_params :purchase_date, :supplier, :product, :quantity, :unit_cost, :commission_rate, 
  :total_unit_cost, :liens_cost, :insurance_cost, :storage_cost, :penalty_cost, :witholding_tax, 
  :commission_amount, :payable_gross, :payable_net, :reference_number

  config.sort_order = "updated_at_desc"

  index do
    selectable_column
    column :purchase_date
    column "Reference #" do |direct_purchase|
      direct_purchase.reference_number
    end
    column :supplier
    column :product
    column :quantity
    column :unit_cost do |direct_purchase|
      number_to_currency(direct_purchase.unit_cost, unit: "₱")
    end
    column "Total Commision" do |direct_purchase|
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
    column "Liens" do |direct_purchase|
      number_to_currency(direct_purchase.liens_cost, unit: "₱")
    end
    column "Insurance" do |direct_purchase|
      number_to_currency(direct_purchase.insurance_cost, unit: "₱")
    end
    column "Insurance" do |direct_purchase|
      number_to_currency(direct_purchase.storage_cost, unit: "₱")
    end
    column "Penalty" do |direct_purchase|
      number_to_currency(direct_purchase.penalty_cost, unit: "₱")
    end
    column :payable_gross do |direct_purchase|
      number_to_currency(direct_purchase.payable_gross, unit: "₱")
    end
    column :payable_net do |direct_purchase|
      number_to_currency(direct_purchase.payable_net, unit: "₱")
    end
    column :updated_at
    actions dropdown: true
  end

  show title: :reference_number do
    panel "Direct Purchase Details" do
      attributes_table_for direct_purchase do
        row :purchase_date
        row "Reference #" do
          direct_purchase.reference_number
        end
        row :supplier
        row :product
        row :quantity
      end
      panel "Costs" do
        attributes_table_for direct_purchase do
          row :unit_cost  do |direct_purchase|
            number_to_currency(direct_purchase.unit_cost, unit: "₱")
          end
          row :commission_rate do |direct_purchase|
            number_to_currency(direct_purchase.commission_rate, unit: "₱")
          end
          row :total_unit_cost do |direct_purchase|
            number_to_currency(direct_purchase.total_unit_cost, unit: "₱")
          end
          row :witholding_tax do |direct_purchase|
            number_to_currency(direct_purchase.witholding_tax, unit: "₱")
          end
          row "Total commission" do |direct_purchase|
            number_to_currency(direct_purchase.commission_amount, unit: "₱")
          end
        end
        panel "Misc Fees" do
          attributes_table_for direct_purchase do
            row "Liens" do |direct_purchase|
              number_to_currency(direct_purchase.liens_cost, unit: "₱")
            end
            row "Insurance" do |direct_purchase|
              number_to_currency(direct_purchase.insurance_cost, unit: "₱")
            end
            row "Storage" do |direct_purchase|
              number_to_currency(direct_purchase.storage_cost, unit: "₱")
            end
            row "Penalty" do |direct_purchase|
              number_to_currency(direct_purchase.penalty_cost, unit: "₱")
            end
          end
        end
      end
      panel "Payable" do
        attributes_table_for direct_purchase do
          row "Gross" do |direct_purchase|
            number_to_currency(direct_purchase.payable_gross, unit: "₱")
          end
          row "Net" do |direct_purchase|
            number_to_currency(direct_purchase.payable_net, unit: "₱")
          end
        end
      end
      attributes_table_for direct_purchase do
        row :created_at
        row :updated_at
      end
    end
    active_admin_comments
  end
  
  form do |f|
    panel "Direct Purchase Formulas" do
      ul do
        li "Total Unit Cost = Unit Cost + Commission Rate"
        li "Commssion Amount = Quantity * Commission Rate"
        li "Payable Gross = Quantity + Total Unit Cost"
        li "Payable Net = Gross Payable - Misc Fees - Tax"
      end
    end
    panel "Direct Purchase" do
      f.inputs "Details" do
        f.input :purchase_date, as: :datepicker
        f.input :reference_number, label: "Reference #"
        f.input :supplier, :as => :select, :collection => Supplier.all.map {|supplier| [supplier.supplier_name, supplier.supplier_name]}, :input_html_options => { :class => 'chosen'}
        f.input :product, :as => :select, :collection => Product.all.map {|product| [product.item_name, product.item_name, product.item_name]}, :input_html_options => { :class => 'chosen'}
        f.input :quantity, :input_html => { :value => 0 }
      end
      panel "Costs" do
        f.inputs do
          f.input :unit_cost, :input_html => { :value => 0 }
          f.input :commission_rate, :input_html => { :value => 0 }
          f.input :total_unit_cost, :input_html => { :readonly => true, :value => 0 }
          f.input :witholding_tax, :input_html => { :value => 0 }
          f.input :commission_amount, label: "Total commission", :input_html => { :readonly => true, :value => 0 }
        end
        f.inputs "Misc Fees" do
          f.input :liens_cost, label: "Liens", :input_html => { :value => 0 }
          f.input :insurance_cost, label: "Insurance", :input_html => { :value => 0 }
          f.input :storage_cost, label: "Storage", :input_html => { :value => 0 }
          f.input :penalty_cost, label: "Penalty", :input_html => { :value => 0 }
        end
      end
      f.inputs "Payable" do
        f.input :payable_gross, label: "Gross", :input_html => { :readonly => true, :value => 0 }
        f.input :payable_net, label: "Net", :input_html => { :readonly => true, :value => 0 }
      end
    end
    f.actions
  end

end
