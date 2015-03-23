class Salesman < ActiveRecord::Base

	validates :salesman_code,  presence: true
	validates :salesman_name,  presence: true

end
