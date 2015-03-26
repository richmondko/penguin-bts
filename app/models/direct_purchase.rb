class DirectPurchase < ActiveRecord::Base

	validates :purchase_date,  presence: { message: "Please choose a date"}
	validates :supplier,  presence: true
	validates :product,  presence: true
	validates :quantity,  presence: true, numericality: { greater_than_or_equal_to: 0 }	
	validates :unit_cost,  presence: true, numericality: { greater_than_or_equal_to: 0 }	
	validates :commission_rate,  presence: true, numericality: { greater_than_or_equal_to: 0 }
	validates :liens_cost, numericality: { greater_than_or_equal_to: 0 }
	validates :insurance_cost, numericality: { greater_than_or_equal_to: 0 }
	validates :storage_cost, numericality: { greater_than_or_equal_to: 0 }
	validates :penalty_cost, numericality: { greater_than_or_equal_to: 0 }
	validates :witholding_tax,  presence: true, numericality: { greater_than_or_equal_to: 0 }
	validates :reference_number, presence: true
	
end
