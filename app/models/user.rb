class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum role: { buyer: 0, seller: 1, admin: 2 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :properties, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :enquiries, dependent: :destroy
  has_many :transactions, dependent: :destroy
  has_many :histories, dependent: :destroy
  has_many :interesteds
  has_many :interested_properties, through: :interesteds, source: :property
  after_create :send_welcome_email

private

def send_welcome_email
  UserMailer.welcome_email(self).deliver_now
end

        
  validates :name, presence: true
  #validates :contact, presence: true, format: { with: /\A\d{10}\z/, message: "must be a valid 10-digit number" }
end
