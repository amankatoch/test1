class UsersController < ApplicationController
  
  def index
    
    users = {}
      users['name']=["john","albert"]
      users['email']="ron"

    @be=users
    #render :plain =>users.inspect
  end

  def show
    
  end

  def new
    
  end

  def edit
   
  end

  def create
    
  end

  def update
    
  end

  def destroy
   
  end
end