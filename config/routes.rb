Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :study_items do
    resources :comments, only: %i[create destroy show]
    patch 'complete', on: :member
  end

  resources :categories

  root to: 'study_items#index'
end
