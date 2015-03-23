class DirectPurchase < ActiveRecord::Base

	has_many :misc_fees

	accepts_nested_attributes_for :misc_fees, allow_destroy: true

	validates :purchase_date,  presence: { message: "Please choose a date"}
	validates :supplier,  presence: true
	validates :product,  presence: true
	validates :quantity,  presence: true, numericality: { greater_than_or_equal_to: 0 }	
	validates :commission_rate,  presence: true, numericality: { greater_than_or_equal_to: 0 }
	validates :witholding_tax,  presence: true, numericality: { greater_than_or_equal_to: 0 }
	validates :reference_number, presence: true
end
