Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
  
  # get 'users/' => 'users#index'
  # get 'users/:id' => 'users#show'

  # get 'users/:user_id/posts' => 'posts#index'
  # get 'users/:user_id/posts/:id' => 'posts#show'
  # Defines the root path route ("/")
  root 'users#index'
end
