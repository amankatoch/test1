class UserMailer < ActionMailer::Base
  default from: 'aman_katoch@esferasoft.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: 'aman_katoch@esferasoft.com', subject: 'Welcome to My Awesome Site')
  end
end