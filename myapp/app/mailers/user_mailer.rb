class UserMailer < ActionMailer::Base
  default from: 'notifications@example.com'
 
  def welcome_email(user)
  	
    @user = user
    @url  = 'set_url'
    mail(to: @user.name, subject: @user.description)
  end
end