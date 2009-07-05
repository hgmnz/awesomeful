# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_awesomeful_session',
  :secret      => '9f2019375132cb50c225543da53e2cf829bf4b81c27fcb2eadc842160b8a516be14308db0e5027c38bb48f6a8ef94b93566077eb48e1f011465b7870197eae1b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
