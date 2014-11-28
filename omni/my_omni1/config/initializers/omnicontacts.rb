require "omnicontacts"

Rails.application.middleware.use OmniContacts::Builder do
  importer :gmail, "729486574897-0ajja6eb3q5c0odkglijh6c3vkei8jq5.apps.googleusercontent.com", "mzU12YFM1GY4YPsJjYenY7qb", {:redirect_path => "/oauth2callback", :ssl_ca_path => "/etc/ssl/certs/curl-ca-bundle.crt"}
 
end