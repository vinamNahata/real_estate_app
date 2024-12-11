class Property < ApplicationRecord
  belongs_to :user
  has_one :booking, dependent: :destroy
  has_many :enquiries, dependent: :destroy


  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
