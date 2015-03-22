class DirectPurchaseController < ApplicationController
  def update_unit_cost
    @product = Product.find_by_id(params[:product_id])
  end
end
