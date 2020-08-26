Rails.application.routes.draw do
  devise_for :users do
    delete "/users/sign_out" => "devise/sessions#destroy"
    get "/users/sign_in" => "devise/sesions#new"
    get "/users/sign_up" => "devise/registrations#new"
  end
  root "posts#index"
  resources :posts do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :users, only: [:new, :show, :create]
  resources :categories, only: [:show, :index]
  resources :areas, only: [:show, :index]
end