Rails.application.routes.draw do
  root 'top#index'
  devise_for :users
  resources :rooms do
     collection do
      get 'search'
      get 'check'
      post 'confirm' # 確認画面
      post 'back' # 確認画面から「入力画面に戻る」をクリックしたとき
      post 'complete' # 完了画面   
   end
  end
  resources :reservations do
      collection do
      post 'confirm' # 確認画面
      post 'back' # 確認画面から「入力画面に戻る」をクリックしたとき
      post 'complete' # 完了画面    
    end
  end    
  resources :mypages
  resources :users  
  get 'finder' => 'finders#finder'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
