class CitiesController < ApplicationController

  def index
    @cities = City.all
  end

  def show
    @city = City.find(params[:id])
    p @city.users
  end

  def new
    # Méthode qui crée une ville vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
    @new_city = City.new
  end

  def create
    
    @new_city = City.new(
      name: params[:name], 
      zip_code: params[:zip_code], 
    )
    
    if @new_city.save
      redirect_to cities_path, :flash => { :success => "Votre ville a été créé" }
    else
      render 'new'
    end
    
    
    # Méthode qui créé une ville à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
  end

  def edit
    # Méthode qui récupère la ville concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  end

  def update
    # Méthode qui met à jour la ville à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
  end

  def destroy
    # Méthode qui récupère la ville concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
  end

end
