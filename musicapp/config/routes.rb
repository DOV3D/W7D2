Rails.application.routes.draw do
  resources :users, only: [:new, :show, :create]

  resource :session, only: [:new, :create, :destroy]
 
 resources :bands do
  resources :albums, only: [:new]
 end

 resources :albums, only: [:create, :edit, :show, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
