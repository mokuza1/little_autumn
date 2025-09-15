Rails.application.routes.draw do
  root "posts#new"
  resources :posts, only: %i[index new create]
end
