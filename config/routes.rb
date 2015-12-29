Rails.application.routes.draw do
  
  get 'credentials/new'

  get 'credentials/create'

  resources :credentials
  
  root 'pages#home'
  
  #Root to each static page
  get '/home', to: 'pages#home'
  
  #post '/get_season', to: 'application#get_season'
  
  match ':controller(/:action(/:id))', :via => :get
  
end