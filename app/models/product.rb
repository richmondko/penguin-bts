class Product < ActiveRecord::Base
	has_many :liens

	accepts_nested_attributes_for :liens, :allow_destroy => true
end
