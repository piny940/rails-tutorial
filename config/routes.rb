Rails.application.routes.draw do
  root 'homes#show'
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'
  get 'login/', to: "sessions#new"
  post 'login/', to: "sessions#create"
  delete 'logout/', to: "sessions#destroy"
  resources :users
end
