Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :study_items, :categories
  root to: 'study_items#index'
end
