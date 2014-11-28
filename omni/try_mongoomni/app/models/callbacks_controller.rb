class CallbacksController < Devise::OmniauthCallbacksController
    def facebook
        @user = User.from_omniauth(request.env["omniauth.auth"])
        sign_in_and_redirect @user
        #render :plain =>  @user.inspect
    end
    def twitter
        @user = User.from_omniauth(request.env["omniauth.auth"])
        #sign_in_and_redirect @user
        render :plain =>  @user.inspect
    end
    def linkedin
        @user = User.from_omniauth(request.env["omniauth.auth"])
        sign_in_and_redirect @user
    end
    
    def google
         @user = User.from_omniauth(request.env["omniauth.auth"])
         sign_in_and_redirect @user
    
    end



    
end