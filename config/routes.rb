Rails.application.routes.draw do
  resources :users
  resources :employees
  root "users#index"
  get "/employees/new/:id" , to: 'employees#new', as: 'new_user_employee'
end