class User < ActiveRecord::Base
	before_create :generate_authentication_token
	has_many :transactions
	has_secure_password

	def generate_authentication_token
		loop do
			self.token = SecureRandom.base64(64)
			break unless User.find_by(token: token)
		end
	end

end
