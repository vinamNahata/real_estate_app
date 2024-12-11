class Transaction < ApplicationRecord
  belongs_to :user


  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :transaction_type, presence: true, inclusion: { in: %w[credit debit] }
end
