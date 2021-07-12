Rails.application.routes.draw do

  
  root 'top#index'
  devise_for :users
  resources :rooms 
  resources :reservations
  resources :users  # 追加
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
