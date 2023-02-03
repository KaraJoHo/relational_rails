Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/planetary_systems', to: 'planetary_systems#index'
  get '/planetary_systems/new', to: 'planetary_systems#new'
  get '/planetary_systems/:id', to: 'planetary_systems#show'

  get '/planets', to: 'planets#index'
  get '/planets/:id', to: 'planets#show'
  get '/planets/:id/edit', to: 'planets#edit'

  get '/planetary_systems/:planetary_system_id/planets', to: 'planetary_system_planets#index'
  get '/planetary_systems/:planetary_system_id/planets/new', to: 'planetary_system_planets#new'
  get '/planetary_systems/:planetary_system_id/edit', to: 'planetary_systems#edit'

  post '/planetary_systems', to: 'planetary_systems#create'
  post '/planetary_systems/:planetary_system_id/planets', to: 'planetary_system_planets#create'
 
  patch '/planetary_systems/:planetary_system_id', to: 'planetary_systems#update'
  patch '/planets/:id', to: 'planets#update'
end
