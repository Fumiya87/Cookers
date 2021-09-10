Rails.application.routes.draw do
  devise_for :cooks
  devise_for :users
  root to: 'homes#top'
    get "/home/about" =>"homes#about"
    resources :cooks
    resources :users
    get "/users/sign_up" =>"homes#sign_up"
    get "/users/sign_in" =>"users#sign_in"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
