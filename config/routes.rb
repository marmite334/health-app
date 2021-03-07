Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
  }

  devise_scope :user do
    get 'sign_in', :to => 'users/sessions#new'
    get 'sign_out', :to => 'users/sessions#destroy'
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  
  root to: 'posts#index'
  resources :posts do
    resources :comments, only: :create
  end
  resources :users, only: :show
  resources :chats, only: %i[index create destroy]
end
