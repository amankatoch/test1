class HomeController < ApplicationController
  helper_method :mymethod
  helper_method :send_admin_mail 
  def index
    @users = User.all
    @test ="this is test "

  end

  def mymethod
  	p "this is my method "
  end

  def send_admin_mail
    UserMailer.welcome_email(@user).deliver
  end


end
