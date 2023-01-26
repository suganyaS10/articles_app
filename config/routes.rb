Rails.application.routes.draw do
  root to: "articles#index"
  resources :articles, only: %i[index]
  resources :likes, only: %i[create]
end
