Rails.application.routes.draw do
  resources :candidates, only: [:create, :show]

  root "candidates#new"
end
