class AppController < ApplicationController

  before_action :authenticate_user, only: [:index]
  
  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end
  
  def index
    @potins = Gossip.all
    @cu = User.find(session[:user_id])
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
