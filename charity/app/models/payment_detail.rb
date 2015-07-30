class PaymentDetail < ActiveRecord::Base
	belongs_to :bet
	belongs_to :appeal
end
