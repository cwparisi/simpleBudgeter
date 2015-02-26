class Fund < ActiveRecord::Base
	has_many :transactions, :dependent => :destroy
	belongs_to :user
	validates :name, presence: true
	validates :amount, presence: true, numericality: { greater_than: 0 }
	validates :color, presence: true, length: { is:7 }
	validates :iconUrl, presence: true
	validates :user, presence: true

	def icons
		["home", "bed", "subway", "train", "car", "bank", "beer", "bicycle", "book", "bus", "cab", "child", "coffee", "cutlery", "desktop", "diamond", "eye", "female", "film", "gamepad", "gift", "glass", "graduation-cap", "heart", "headphones", "institution", "laptop", "lightbulb-o", "male", "mobile", "money", "music", "paint-brush", "paw", "pencil", "phone", "plane", "shopping-cart", "suitcase", "ticket", "university", "wrench"]
	end
end
