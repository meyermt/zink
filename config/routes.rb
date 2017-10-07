Rails.application.routes.draw do


  root 'intro#index'

  # Sessions

  get '/sessions/new' => 'sessions#new', as: 'new_session'
  post '/sessions' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  get '/links/new' => 'links#new'
  post '/links' => 'links#create'

  get '/links/:uuid' => 'links#show'

  get '/z/:uuid' => 'links#show'

  delete '/links/:id' => 'links#destroy'

  resources :users




end
