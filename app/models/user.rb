class User < ActiveRecord::Base
	has_many :transactions
	has_many :funds
	has_many :incomes
	validates :userName, presence: true, length: { minimum: 3 }, uniqueness: { case_sensitive: false }

	def full_name
    	"#{firstName} #{lastName}"
  	end

  	has_secure_password
  	validates :password, length: { minimum: 6 }
end
