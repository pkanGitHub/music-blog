Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users #do
  
  resources :songs do
    resources :song_reviews, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  root 'songs#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
