class UserMailer < ApplicationMailer
  def welcome_to_driftmap(user)
    @user = user
    @greeting = "Greetings #{@user.first_name} #{@user.last_name}, Welcome to driftMap!"
    mail to: @user.email, subject: @greeting
  end

  def password_reset(user)
    @user = user
    @greeting = "Greetings #{@user.first_name}, reset your driftMap password"
    mail to: @user.email, subject: @greeting
  end
end
