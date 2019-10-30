Rails.application.routes.draw do
  
  root 'app#index'
  resources :gossips
  
  #get '/gossip/:id', to: 'app#show', as: 'show'
  #get '/user/:id', to: 'app#show_user', as: 'show_user'
  get '/welcome/:name', to: 'app#welcome'
  get '/team', to: 'app#team'
  get '/contact', to: 'app#contact'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
