class BillOfLadingAndVan < ActiveRecord::Base

	validates :bl_date,  presence: { message: "Please choose a date"}
	validates :supplier,  presence: true
	validates :shipping_line,  presence: true
	validates :vessel,  presence: true
	validates :voyage,  presence: true
	validates :bl_number,  presence: true
	validates :van_number, presence: true
	validates :product, presence: true
	validates :reference_number, presence: true
	validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
	
end
