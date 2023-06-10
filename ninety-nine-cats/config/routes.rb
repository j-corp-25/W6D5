Rails.application.routes.draw do
  # get 'cat/index'
  # get 'cat/show'
  # get 'cat/new'
  # get 'cat/edit'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :cats, except:[:destroy ]
  # Defines the root path route ("/")
  root "cats#index"
end
