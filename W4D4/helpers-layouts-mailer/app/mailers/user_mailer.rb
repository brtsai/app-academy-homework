class UserMailer < ActionMailer::Base
  default from: 'every@appacademy.io'
  layout 'mailer'

  def welcome_email(user)
    @user = user
    @url  = 'http://www.99cats.com/login'
    mail(to: "#{@user.username}@appacademy.io", subject: 'Welcome to My Awesome Site')
  end
end
