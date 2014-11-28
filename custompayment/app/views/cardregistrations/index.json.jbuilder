json.array!(@cardregistrations) do |cardregistration|
  json.extract! cardregistration, :id, :ip_address, :first_name, :last_name, :card_type, :card_expires_on
  json.url cardregistration_url(cardregistration, format: :json)
end
