class LikesController < ApplicationController

  def create 
    gossip = Gossip.find(params[:gossip_id])
    like = Like.new(user: current_user, gossip: gossip)
    
    if like.save
      redirect_to gossips_path
    else
      redirect_to gossips_path, :flash => { :danger => "Erreur" }
    end
    
  end
  
  def destroy 
    if Like.find_by(user: current_user, gossip: params[:id]).destroy()
      redirect_to gossips_path
    else
      redirect_to gossips_path, :flash => { :danger => "Erreur" }
    end
    
  end
end
