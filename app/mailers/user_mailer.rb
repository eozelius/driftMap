class UserMailer < ApplicationMailer
  def welcome_to_driftmap(user)
    @user = user
    @greeting = "Greetings, #{@user.first_name} #{@user.last_name}"

    mail to: @user.email, subject: "Welcome to driftMap"
  end
end
