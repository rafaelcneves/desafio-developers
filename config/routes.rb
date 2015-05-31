Rails.application.routes.draw do

  resources :candidates

  root "candidates#new"
end
