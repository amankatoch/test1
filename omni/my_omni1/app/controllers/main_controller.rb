class MainController < ApplicationController
   def index
    puts "hello"
   end
 def contact
   @contacts = request.env['omnicontacts.contacts']
   respond_to do |format|
   format.html 
   end
 end
end
