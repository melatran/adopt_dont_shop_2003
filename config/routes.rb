Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/shelters', to: 'shelters#index'
  get '/shelters/new', to: 'shelters#new'
  get '/shelters/:id/edit', to: 'shelters#edit'
  post '/shelters', to: 'shelters#create'
  patch '/shelters/:id', to: 'shelters#update'
  get '/shelters/:id', to: 'shelters#show'
  delete '/shelters/:id', to: 'shelters#destroy'
  get '/shelters/:id/pets', to: 'shelters#pets'

  get '/pets', to: 'pets#index'
  get '/shelters/:id/pets/new', to: 'pets#new'
  post '/shelters/:id/pets', to: 'pets#create'
  get '/pets/:id/edit', to: 'pets#edit'
  patch '/pets/:id', to: 'pets#update'
  delete '/pets/:id', to: 'pets#destroy'
  get '/pets/:id', to: 'pets#show'
end
