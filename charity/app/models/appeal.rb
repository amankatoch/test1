class Appeal < ActiveRecord::Base
	has_many :charitymedium, :class_name => 'CharityMedia', dependent: :destroy
	has_many :payment_details, dependent: :destroy
	has_many :appeal_donations, dependent: :destroy
end
