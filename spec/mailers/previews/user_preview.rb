# Preview all emails at http://localhost:3000/rails/mailers/user
class UserPreview < ActionMailer::Preview
  def welcome_to_driftmap
    @user = User.first
    @greeting = "Greetings, #{@user.first_name} #{@user.last_name}"

    # mail to: @user.email, subject: "Welcome to driftMap"
    UserMailer.welcome_to_driftmap(@user)
  end

  def password_reset
    @user = User.first
    @greeting = "Greetings #{@user.first_name}, reset your driftMap password"
    UserMailer.password_reset(@user)
  end
end
