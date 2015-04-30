class UserMailer < ActionMailer::Base
  default from: 'luca_yvz@hotmail.com'
  def send_welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Montclair Portal')
  end
end