class HomeController < ActionController::Base

def index
  @user=User.all
end



end
