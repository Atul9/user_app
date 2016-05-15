class User < ActiveRecord::Base
	before_validation :validate_password_length, :match_password_with_confirmation
	validates_presence_of :email, :password, :confirm_password

	def validate_password_length
		if self.password.length < 6
			self.errors.add(:password, "Length should be greater than 6 characters.")
		end
	end

	def match_password_with_confirmation
		unless self.password.eql?(self.confirm_password)
			self.errors.add(:password, "Passwords do not match")
		end
	end
end
