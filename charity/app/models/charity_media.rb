class CharityMedia < ActiveRecord::Base
	# mount_uploader :picture, PictureUploader
	belongs_to :charityusersquare
	belongs_to :bet
	belongs_to :appeal
end
