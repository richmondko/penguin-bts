ActiveAdmin.register Product do

  permit_params :item_code, :item_name, :item_type, :central_name, :origin, :class_type, :unit_cost, :liens

end
