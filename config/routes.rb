Rails.application.routes.draw do
  resources :lessons
  resources :courses
  resources :services
  resources :classrooms
  devise_for :users
  resources :users, only: [:index, :show, :destroy, :edit, :update]
  root "static_pages#landing_page"
  get "privacy_policy", to: "static_pages#privacy_policy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
