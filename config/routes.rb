Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :admins, skip: :all
    devise_scope :admin do
      get 'admins/sign_in' => 'admins/sessions#new'
      post 'admins/sign_in' => 'admins/sessions#create'
      delete 'logout' => 'admins/sessions#destroy'
    end
      devise_for :admins, controllers: {
        registrations: 'admins/registrations',
        sessions: 'admins/sessions'
      }

    devise_for :users, skip: :all
      devise_scope :user do
        get 'users/sign_in' => 'users/sessions#new'
        post 'users/sign_in' => 'users/sessions#create'
        delete 'logout' => 'users/sessions#destroy'
      end
      devise_for :users, controllers: {
        registrations: 'users/registrations',
        sessions: 'users/sessions'
      }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
