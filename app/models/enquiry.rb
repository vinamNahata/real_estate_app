class Enquiry < ApplicationRecord
  belongs_to :user
  belongs_to :property
  

  validates :message, presence: true
end
