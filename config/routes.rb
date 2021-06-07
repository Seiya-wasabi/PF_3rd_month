Rails.application.routes.draw do
  get 'real_properties/new'
  resources :user_lists,only: [:index]
  root to: 'homes#top'
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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
