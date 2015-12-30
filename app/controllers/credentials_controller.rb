class CredentialsController < ApplicationController
  
  def index
   
  end
  
  def show
    @credential = Credential.find(params[:id])
  end
  
  def new
  end

  def create
    @credential = Credential.new(credentials_params)
    @credentials_index = Credential.all
    
     #validate rule from credential.rb class 
    if @credential.save
      redirect_to @credential
    else
      render 'show'
    end
  end
  
  
  
  private
  def credentials_params
    params.require(:credential).permit(:client_id, :client_secret, :ws_key)
  end
end
