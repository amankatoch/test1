class AppealDonation < ActiveRecord::Base
	belongs_to :user
	belongs_to :appeal
end
