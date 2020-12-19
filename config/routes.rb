Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :study_items do
    resources :comments, only: %i[create destroy show]
    patch 'complete', on: :member
    get 'search', on: :collection
  end

  resources :categories

  root to: 'study_items#index'
end
