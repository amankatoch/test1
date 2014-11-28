class AdminController < ApplicationController
  protect_from_forgery with: :exception
   before_action :authenticate_user!
def add

@product = Product.new(product_params)
     @product.save
     @custom = UserMailer.welcome_email(@product).deliver
     render :plain => @custom.inspect

     #redirect_to root_path
     #redirect_to { :action=>'addform' }, :alert => "Something serious happened"
    #respond_with(@product)	
# render :plain => @product.inspect

end	

def addform
@product = Product.new
   # respond_with(@product)
end	

private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:@product).permit(:name, :price, :description)
    end

end