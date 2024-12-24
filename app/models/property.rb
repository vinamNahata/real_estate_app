class Property < ApplicationRecord
  belongs_to :user
  has_one :booking, dependent: :destroy
  has_many :enquiries, dependent: :destroy
  has_one_attached :image

  validates :name, :description, :price, :location, presence: true
end
