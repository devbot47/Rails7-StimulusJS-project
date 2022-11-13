Rails.application.routes.draw do
  resources :users
  resources :employees
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
   root "users#index"
  get "/employees/new/:id" , to: 'employees#new', as: 'new_user_employee'
end



