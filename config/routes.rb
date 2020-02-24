Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users do
    resources :songs, only: [:index, :show, :new, :edit] do
      resources :song_reviews, only: [:edit, :show]
    end
  end

  resources :song_reviews, only: [:index]
  resources :songs, only: [:index, :new, :create, :edit, :update, :show]

  root 'songs#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
