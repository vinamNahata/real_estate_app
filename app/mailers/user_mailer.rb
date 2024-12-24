class UserMailer < ApplicationMailer
    default from: "no-reply@RealEstate.com"

    def welcome_email(user)
        @user = user
        mail(to: @user.email, subject: "Welcome to Real Estate Platform.")
    end
end
