# app/models/enquiry.rb
class Enquiry < ApplicationRecord
  belongs_to :user
  belongs_to :property

  validates :message, presence: true

  after_create :send_enquiry_email

  private

  def send_enquiry_email
    UserMailer.property_enquiry_email(self).deliver_now  # Sending email asynchronously
  end
end
