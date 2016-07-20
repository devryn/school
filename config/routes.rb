Rails.application.routes.draw do
  get 'sessions/sign-in'

  get 'sessions/sign_in'
  post 'sessions/authenticate'

  resources :users
  resources :courses
  resources :students
  resources :teachers
  resources :schools

  root 'schools#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
