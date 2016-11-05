class User < ApplicationRecord
	#before_save { self.email = email.downcase }
	before_save { email.downcase! }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
					   #/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :name,presence: true,length: {maximum: 20}


	validates :email,presence: true,length: {maximum: 255},
				format: {with: VALID_EMAIL_REGEX} , 
				uniqueness: {case_sensitive: false}

	validates :password, length: { minimum: 6 } , presence: true 
	#length: {in: 2..20 }
	has_secure_password
end
