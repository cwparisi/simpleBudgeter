class User < ActiveRecord::Base
	has_many :transactions, :dependent => :destroy
	has_many :funds, :dependent => :destroy
	has_many :incomes, :dependent => :destroy
	validates :userName, presence: true, length: { minimum: 3 }, uniqueness: { case_sensitive: false }

	def full_name
    	"#{firstName} #{lastName}"
  	end

  	has_secure_password
  	validates :password, length: { minimum: 6 }
end
