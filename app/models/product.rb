class Product < ActiveRecord::Base

	has_many :liens

	accepts_nested_attributes_for :liens, allow_destroy: true

	validates :item_code,  presence: true
	validates :item_name,  presence: true
	validates :item_type,  presence: { message: "Please choose an item type" }
	validates :unit_cost,  numericality: { greater_than_or_equal_to: 0 }

end
