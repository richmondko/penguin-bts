class Supplier < ActiveRecord::Base

	validates :supplier_code,  presence: true
	#, uniqueness: { message: "already exists"}
	validates :supplier_name,  presence: true
	validates :supplier_type,  presence: { message: "Please choose a type"}, uniqueness: { message: "already exists"}

end
