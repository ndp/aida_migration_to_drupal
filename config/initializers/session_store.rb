# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_aida_session',
  :secret      => '79f40fdb5ac7f3cdf0360a1815e27316b114b9508f8c8b91eaaf8a31a3dd5b398ae88a7814c5016551b5daf4fb71738ed3fed1ab912f8745743b2ceb08fa64c4'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
