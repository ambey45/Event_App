Rails.application.routes.draw do
  get 'home/index'
  root 'events#index'
  devise_for :users, :controllers => {:registrations => "users/registrations",:sessions => "users/sessions"}

  resources :events, only: [:index, :show] do
  	post 'attend', on: :member
  	post 'unattend',on: :member
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
