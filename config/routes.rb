Rails.application.routes.draw do
  devise_for :users

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post '/login', to: 'authentication#authenticate'
      resources :users, only: [:index, :show] do
        resources :posts, only: [:index, :show, :create, :new, :destroy] do
          resources :comments, only: [:create, :new, :index, :destroy]
          resources :likes, only: [:create]
        end
      end
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # add new separate route as ressource
  resources :home, only: [:index]

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end

  root 'home#index'
end
