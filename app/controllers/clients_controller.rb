class ClientsController < ApplicationController
  load_and_authorize_resource
  
  def new
  end
  
  def create
    @client = Client.new params[:client]
    if @client.save
      current_user.update_attributes :client_id => @client.id
      redirect_to client_path(@client)
    else
      render :action => :new
    end
  end

  def edit
  end
  
  def update
    if @client.update_attributes params[:client]
      redirect_to client_path(@client)
    else
      render :action => :edit
    end
  end
  
  def show
  end
  
end
