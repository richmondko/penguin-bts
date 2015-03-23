class Lien < ActiveRecord::Base

	belongs_to :product

	validates :name,  presence: true
	validates :cost,  numericality: { greater_than_or_equal_to: 0 }

end
