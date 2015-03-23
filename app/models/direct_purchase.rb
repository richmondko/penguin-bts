class DirectPurchase < ActiveRecord::Base

	has_many :misc_fees

	accepts_nested_attributes_for :misc_fees, allow_destroy: true

end
