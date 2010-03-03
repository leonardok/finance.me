# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_code_session',
  :secret      => '920edfacb8484d8890b8c98fdb293e82e0ad0a903f30005ed407f7136a232c79d65dc96b4c1934586f74e4db7164774d6ab84db1712c70a5e686ff82223393c6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
