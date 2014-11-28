class Cardregistration
  include Mongoid::Document
  field :ip_address, type: String
  field :first_name, type: String
  field :last_name, type: String
  field :card_type, type: String
  field :card_expires_on, type: Date
end
