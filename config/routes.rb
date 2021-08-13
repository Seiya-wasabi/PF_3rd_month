Rails.application.routes.draw do
  resources :user_lists,only: [:index]
  root to: 'homes#top'
  resources :homes,only: [:top, :index]
    # devise_scope :admin do
    #   get 'admins/sign_in' => 'admins/sessions#new'
    #   post 'admins/sign_in' => 'admins/sessions#create'
    #   delete 'logout' => 'admins/sessions#destroy'
    # end

    devise_for :users, path: 'users', controllers: {
      sessions: 'users/sessions',
      passwords: 'users/passwords',
      registrations: 'users/registrations'
    }

    devise_for :admins, path: 'admins', controllers: {
      sessions: 'admins/sessions',
      passwords: 'admins/passwords',
      registrations: 'admins/registrations'
    }
    
      get   'inquiry'         => 'inquiry#index'     # 入力画面
      post  'inquiry/confirm' => 'inquiry#confirm'   # 確認画面
      post  'inquiry/thanks'  => 'inquiry#thanks'    # 送信完了画面

    resources :areas, only: [:new, :create] do
      collection do
        get 'get_cities' # /areas/get_cities
      end
    end

    resources :real_properties, only: [:new, :create, :index]
    resources :customers, only: [:index, :show]
end
