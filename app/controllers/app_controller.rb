class AppController < ApplicationController

  def index
    @potins = Gossip.all
  end
  
  def show
    @potin = Gossip.find(params[:id])
  end
  
  def show_user
    @user = User.find params[:id]
    p @user
  end

  def welcome
    @user = params[:name]
  end

  def team
  end
  
  def contact
  end
  
end
