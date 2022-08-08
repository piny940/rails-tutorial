Rails.application.routes.draw do
  get '/signup', to: "users#new"
  root 'application#show'
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'
end
