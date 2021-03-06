class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def update_unit_cost
    @product = Product.find_by_id(params[:product_id])
  end
  
end
