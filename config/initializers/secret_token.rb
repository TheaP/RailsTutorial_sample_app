# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
<<<<<<< HEAD

=======
>>>>>>> 0b28430929ef35004b10ed6de08998e82bc89fa5
require 'securerandom'

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist?(token_file)
<<<<<<< HEAD
		# Use the existing token.
=======
		# Use the existing token
>>>>>>> 0b28430929ef35004b10ed6de08998e82bc89fa5
		File.read(token_file).chomp
	else
		# Generate a new token and store it in token_file
		token = SecureRandom.hex(64)
		File.write(token_file, token)
		token
	end
end

<<<<<<< HEAD
NeonateConnect::Application.config.secret_key_base = secure_token
=======
SampleApp::Application.config.secret_key_base = secure_token

>>>>>>> 0b28430929ef35004b10ed6de08998e82bc89fa5
