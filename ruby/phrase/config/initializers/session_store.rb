# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_phrase_session',
  :secret      => 'fb0b82a99a4f2769d254e53e05000ed0cc3d90877988370316b68f28f7c11305da988073360af426dca770df446bf06d9b0dfc1da245955009c235a56b9cf213'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
