class Transaction < ActiveRecord::Base
  belongs_to :fund
  belongs_to :user
  validates :location, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :date, presence: true
  validates :fund, presence: true
  validates :transactionType, presence: true
  validates :user, presence: true
  validates :description, length: {maximum: 40}
end
