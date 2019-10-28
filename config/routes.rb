Rails.application.routes.draw do
  
  get '/team', to: 'app#team'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
