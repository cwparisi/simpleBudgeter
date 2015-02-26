class Income < ActiveRecord::Base
	belongs_to :user
	validates :name, presence: true
	validates :amount, presence: true, numericality: { greater_than: 0 }
	validates :frequency, presence: true
	validates :weekly_hours, presence: true, numericality: { greater_than: 0 }
	validates :user, presence: true
end
