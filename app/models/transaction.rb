class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :description, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :transaction_type, presence: true, inclusion: { in: %w[income expense] }
  validates :date, presence: true
end