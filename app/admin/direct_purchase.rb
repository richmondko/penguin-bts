ActiveAdmin.register DirectPurchase do

menu parent: "Transaction"

  permit_params :supplier, :product, :quantity, :unit_cost, :commission_rate, 
  :total_unit_cost, :misc_fees_liens, :misc_fees_insurance, :misc_fees_storage, :misc_fees_penalty,
  :witholding_tax, :commission_amount, :payable_gross, :payable_net, :reference_number
 
  index do
    selectable_column
    column :supplier
    column :product
    column :quantity
    column :unit_cost
    column :commission_rate
    column :total_unit_cost
    column :misc_fees_liens
    column :misc_fees_insurance
    column :misc_fees_storage
    column :misc_fees_penalty
    column :witholding_tax
    column :commission_amount
    column :payable_gross
    column :payable_net
    column :reference_number
    actions
  end

  form do |f|
    f.inputs "Direct Purchase Details" do
      f.input :supplier
      f.input :product, :as => :select, :collection => Product.all.map {|product| [product.item_name, product.unit_cost]}
      f.input :quantity
      f.input :unit_cost
      f.input :commission_rate
      f.input :total_unit_cost, :input_html => { :readonly => true }
      f.input :misc_fees_liens
      f.input :misc_fees_insurance
      f.input :misc_fees_storage
      f.input :misc_fees_penalty
      f.input :witholding_tax
      f.input :commission_amount
      f.input :payable_gross
      f.input :payable_net
      f.input :reference_number
    end
    f.actions
  end
end
