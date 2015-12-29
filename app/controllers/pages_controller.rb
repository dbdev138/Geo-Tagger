class PagesController < ApplicationController
    #Each function correspondes to a page view
    # def home loads -> home.html.erb
    # any functions nested in the home function will be executed on the home page
  
  #Any Actions within the home page must be rendered here
  def home
    
    #Call the method here
    message
  end
  
  
   def message
      @controller_message = "Hello from PagesController"
   end
end