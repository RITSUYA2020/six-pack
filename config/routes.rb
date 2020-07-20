Rails.application.routes.draw do
  root 'homes#top'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'users/:user_id/favorites' => 'favorites#show', as: 'user_favorites'
  resources :users, except: [:index, :create, :new]
  resources :work_outs do
  	resource :favorites, only: [:create, :destroy]
  end
end
