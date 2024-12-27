class Property < ApplicationRecord
  belongs_to :user
  has_one :booking, dependent: :destroy
  has_many :enquiries, dependent: :destroy
  has_many_attached :images
  has_many :interesteds
has_many :interested_users, through: :interesteds, source: :user
  validates :name, :description, :price, :location, presence: true
end
