Rails.application.routes.draw do
  devise_for :users do
    delete "/users/sign_out" => "devise/sessions#destroy"
    get "/users/sign_in" => "devise/sesions#new"
    get "/users/sign_up" => "devise/registrations#new"
  end
  root "posts#index"
  resources :posts do
    collection do
      get 'search'
    end
  end
  resources :users, only: [:new, :show, :create]
end