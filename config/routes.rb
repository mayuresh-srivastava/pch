Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "projects#index"

  resources :projects, only: %i[index show] do
    resources :project_histories, only: %i[create index edit update destroy]
  end
end
