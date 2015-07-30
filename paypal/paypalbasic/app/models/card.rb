class Card < ActiveRecord::Base
  belongs_to :registration
  has_one :card_transaction

  # These attributes won't be stored
  attr_accessor :card_number, :card_verification

  before_create :validate_card

  

  
end
