Rails.application.routes.draw do
  resources :scores[:create]
  resources :users[:index, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
