Rails.application.routes.draw do
  root "posts#top"
  resources :posts, only: %i[index create]
end
