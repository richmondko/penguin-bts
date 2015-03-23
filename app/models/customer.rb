class Customer < ActiveRecord::Base

	validates :customer_code,  presence: true
	#, uniqueness: { message: "already exists"}
	validates :customer_name,  presence: true
	#, uniqueness: { message: "already exists"}

end
