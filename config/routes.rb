Rails.application.routes.draw do
  root 'homes#show'
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'
  resources :users
end
