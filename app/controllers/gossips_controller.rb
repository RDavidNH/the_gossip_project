class GossipsController < ApplicationController

  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def new
    @new_gossip = Gossip.new
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
  end

  def create
    
    u = User.all
    
    @new_gossip = Gossip.new(title: params[:gossip_title], content: params[:gossip_content], user: u[rand(0..u.size)])
    
    if @new_gossip.save
      redirect_to gossips_path, :flash => { :success => "Votre Gossip a été créé" }
    else
      render 'new'
    end
    
    # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
  end

  def edit
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
    @edit_gossip = Gossip.find(params[:id])
  end

  # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
  # pour info, le contenu de ce formulaire sera accessible dans le hash params
  # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
  def update
    @edit_gossip = Gossip.find(params[:id])
    if @edit_gossip.update(title: params[:gossip_title], content: params[:gossip_content])
      redirect_to @edit_gossip, :flash => { :success => "Votre Gossip a été modifié" }
    else
      render :edit
    end
  end

  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
  end


end
