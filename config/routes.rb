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
      get 'purchase_comfirmation' #商品購入確認
      get  'get_category_children', defaults: { format: 'json' }
      get  'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  resources :users, only: [:new, :show, :create]
end