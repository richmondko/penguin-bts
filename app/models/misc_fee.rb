class MiscFee < ActiveRecord::Base

	belongs_to :direct_purchase

	validates :name,  presence: true
	validates :cost,  numericality: { greater_than_or_equal_to: 0 }
	
end
