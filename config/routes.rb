Rails.application.routes.draw do
  root "posts#index"
  resources :posts, only: [:index, :create]

  resources :posts do
    collection do # 新規用（new) usr:posts/newのため
      get 'get_category_children', defaults: { format: 'json' }
    end
    member do # 編集(edit用) usl: posts/id/editのため
      get 'get_category_children', defaults: { format: 'json' }
    end
end
