class Salesman < ActiveRecord::Base

	validates :salesman_code,  presence: true, uniqueness: { message: "already exists"}
	validates :salesman_name,  presence: true, uniqueness: { message: "already exists"}

end
