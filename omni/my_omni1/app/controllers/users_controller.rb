class UsersController < ApplicationController
  before_filter :authenticate_user!
  
   # POST /users
  # POST /users.json
  def create
  	render :plain "test"
    @user = User.new(params[:user])
 
    respond_to do |format|
      if @user.save
        # Tell the UserMailer to send a welcome email after save
        format.html { redirect_to(@user, notice: 'User was successfully created.') }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

end
