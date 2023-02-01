Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/planetary_systems', to: 'planetary_systems#index'
  get '/planetary_systems/:id', to: 'planetary_systems#show'

  get '/planets', to: 'planets#index'
end
