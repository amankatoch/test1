# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_destroy_session',
  :secret      => 'd63d59620f6a3ce8257093b710ed5063a0d32108d11ef1b821dddeb56f799ee598a47df1a22d1aa6382cf00fc29d11c3c67d243e42aee79cf90071a5c57247db'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
